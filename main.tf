data "azuread_client_config" "current" {}


#list all groups
data "azuread_groups" "all" {
  display_names = keys(var.group_names)
  ignore_missing = true
}


resource "random_uuid" "random_role_id" {
  count = length(var.app_role)
}

output "variables_in" {
  value = local.has_domain
}
locals {
  id_group_ls = [var.sub_domain, var.sub_domain, var.it_element]
  has_domain = [for a in id_group_ls: a != null]
    all_groups = data.azuread_groups.all.display_names
    groups-roles-app-map = merge([
    for group, roles in var.group_names : {
      for role in roles :
        "${group}-${role}" => {
          "group" = group
          "role" = role
        }
    }
  ]...)

}

resource "azuread_application" "main" {


  lifecycle {
    precondition {
      condition     = length(local.has_domain) == 1
      error_message = "Estas comiendo pinga, es solo un valor weeeoooon x 3."
    }
  }

  # mandatory arguments
  display_name = var.display_name

  # Optional arguments
  device_only_auth_enabled       = var.device_only_auth_enabled
  fallback_public_client_enabled = var.fallback_public_client_enabled
  group_membership_claims        = var.group_membership_claims
  identifier_uris                = var.identifier_uris
  marketing_url                  = var.marketing_url
  oauth2_post_response_required  = var.oauth2_post_response_required
  owners                         = var.owners
  prevent_duplicate_names        = var.prevent_duplicate_names
  privacy_statement_url          = var.privacy_statement_url
  template_id                    = var.template_id
  terms_of_service_url           = var.terms_of_service_url
  logo_image                     = var.logo_image
  sign_in_audience               = var.sign_in_audience
  support_url                    = var.support_url
  tags                           = var.tags

  dynamic "optional_claims" {
    for_each = var.optional_claims != null ? ["true"] : []
    content {
      dynamic "access_token" {
        for_each = lookup(var.optional_claims, "access_token", [])
        content {
          additional_properties = lookup(var.optional_claims.access_token, "additional_properties", [])
          essential             = lookup(var.optional_claims.access_token, "essential", null)
          name                  = lookup(var.optional_claims.access_token, "name", [])
          source                = lookup(var.optional_claims.access_token, "source", null)
        }
      }

      dynamic "id_token" {
        for_each = lookup(var.optional_claims, "id_token", [])
        content {
          additional_properties = lookup(var.optional_claims.id_token, "additional_properties", null)
          essential             = lookup(var.optional_claims.id_token, "essential", null)
          name                  = lookup(var.optional_claims.id_token, "name", null)
          source                = lookup(var.optional_claims.id_token, "source", null)
        }
      }

      dynamic "saml2_token" {
        for_each = lookup(var.optional_claims, "saml2_token", [])
        content {
          additional_properties = lookup(var.optional_claims.saml2_token, "additional_properties", null)
          essential             = lookup(var.optional_claims.saml2_token, "essential", null)
          name                  = lookup(var.optional_claims.saml2_token, "name", null)
          source                = lookup(var.optional_claims.saml2_token, "source", null)
        }
      }
    }
  }

  dynamic "public_client" {
    for_each = var.public_client != null ? ["true"] : []
    content {
      redirect_uris = lookup(var.public_client, "redirect_uris", null)
    }
  }

  dynamic "single_page_application" {
    for_each = var.single_page_application != null ? ["true"] : []
    content {
      redirect_uris = lookup(var.single_page_application, "redirect_uris", null)
    }
  }

  dynamic "api" {
    for_each = var.api != null ? ["true"] : []
    content {
      mapped_claims_enabled          = lookup(var.api, "mapped_claims_enabled", null)
      requested_access_token_version = lookup(var.api, "requested_access_token_version", null)
      known_client_applications      = lookup(var.api, "known_client_applications", null)

      dynamic "oauth2_permission_scope" {
        for_each = lookup(var.api, "oauth2_permission_scope", [])
        content {
          admin_consent_description  = oauth2_permission_scope.value["admin_consent_description"]
          admin_consent_display_name = oauth2_permission_scope.value["admin_consent_display_name"]
          id                         = oauth2_permission_scope.value["id"]
          enabled                    = lookup(oauth2_permission_scope.value, "enabled", true)
          type                       = oauth2_permission_scope.value["type"]
          user_consent_description   = lookup(oauth2_permission_scope.value, "user_consent_description", null)
          user_consent_display_name  = lookup(oauth2_permission_scope.value, "user_consent_display_name", null)
          value                      = lookup(oauth2_permission_scope.value, "value", null)
        }
      }
    }
  }

  dynamic "web" {
    for_each = var.web != null ? ["true"] : []
    content {
      redirect_uris = lookup(var.web, "redirect_uris", null)
      homepage_url  = lookup(var.web, "homepage_url", null)
      logout_url    = lookup(var.web, "logout_url", null)
      dynamic "implicit_grant" {
        for_each = lookup(var.web, "implicit_grant", null) != null ? [1] : []
        content {
          access_token_issuance_enabled = lookup(var.web.implicit_grant, "access_token_issuance_enabled", null)
          id_token_issuance_enabled     = lookup(var.web.implicit_grant, "id_token_issuance_enabled", null)
        }
      }
    }
  }

  dynamic "app_role" {
    for_each = var.app_role != null ? var.app_role : []
    iterator = role
    content {
      allowed_member_types = role.value.allowed_member_types
      description          = role.value.description
      display_name         = "${var.display_name}_${role.value.display_name}"
      enabled              = lookup(role.value, "enabled", true)
      id                   =  role.value.id == "generate" ? element(random_uuid.random_role_id[*].result, role.key) : lookup(role.value, "id", null)
      value                = "${var.display_name}_${role.value.display_name}"
    }
  }

  dynamic "required_resource_access" {
    for_each = var.required_resource_access != null ? var.required_resource_access : []
    content {
      resource_app_id = required_resource_access.value.resource_app_id
      dynamic "resource_access" {
        for_each = required_resource_access.value.resource_access
        iterator = access
        content {
          id   = access.value.id
          type = access.value.type
        }
      }
    }
  }
}


resource "azuread_service_principal" "internal" {
  application_id = azuread_application.main.application_id
}

resource "azuread_group" "main" {
  for_each = { for group, roles in var.group_names : group => roles if !contains(local.all_groups, group)}
    display_name     = join("",["GRP_",local.id_group_ls[index(local.has_domain, true)],"_",upper(each.key)])  
  #display_name     =  var.it_element != null ? join("",["GRP_",upper(var.it_element),"_",upper(each.key)]) : join("",["GRP_",upper(var.id_domain),"/",upper(var.sub_domain),"_",upper(each.key)]) 
  security_enabled = true
}

resource "azuread_app_role_assignment" "main" {

  depends_on = [azuread_application.main,azuread_group.main]
  for_each = local.groups-roles-app-map
    app_role_id         = azuread_application.main.app_role_ids["${var.display_name}_${each.value.role}"]
    principal_object_id = !can(azuread_group.main[each.value.group].object_id) ? data.azuread_groups.all.object_ids[index(data.azuread_groups.all.display_names,each.value.group)] : azuread_group.main[each.value.group].object_id
    resource_object_id  = azuread_service_principal.internal.object_id
}




