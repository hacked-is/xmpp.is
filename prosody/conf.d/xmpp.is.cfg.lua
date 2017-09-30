VirtualHost "xmpp.is"
http_host = "http.xmpp.is"
modules_enabled = { "onions", "http", "register_web" };
reload_modules = { "tls", "onions", "http", "register_web", "http_upload" };

        enabled = true

        allow_registration = false;
	min_seconds_between_registrations = 300

	c2s_require_encryption = true
	s2s_secure_auth = false

	authentication = "internal_hashed"
        storage = "internal"

	ssl = {
	   certificate = "/etc/prosody/certs/xmpp.is/fullchain.pem";
	   key = "/etc/prosody/certs/xmpp.is/privkey.pem";
}

        https_ssl = {
           certificate = "/etc/prosody/certs/xmpp.is/fullchain.pem";
           key = "/etc/prosody/certs/xmpp.is/privkey.pem";
}

        http_ports = { 5280 }
        http_interfaces = { "*" }

        https_ports = { 5281 }
        https_interfaces = { "*" }

        register_web_template = "/etc/prosody/register-templates/Prosody-Web-Registration-Theme"

        Component "upload.xmpp.is" "http_upload"
        http_upload_file_size_limit = 52428800
        http_upload_expire_after = 60 * 60 * 24 * 7

        Component "muc.xmpp.is" "muc"
        name = "XMPP.is MUC"
        restrict_room_creation = "local"
        
-- Private stuff injected below after git pull --