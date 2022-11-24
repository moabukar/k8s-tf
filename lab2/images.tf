# Terraform resource to create 
resource "docker_image" "php-httpd-image" {
  name = "php-httpd:challenge"
  build {
    path = "lamp_stack/php_httpd"
    label = {
      challenge : "second"
    }
  }
}

resource "docker_image" "mariadb-image" {
  name = "mariadb:challenge"
  build {
    path = "lamp_stack/custom_db"
    label = {
      challenge : "second"
    }
  }
}

resource "docker_container" "php-httpd" {
  name  = "webserver"
  image = docker_image.php-httpd-image.image_id
}

resource "docker_network" "php-httpd" {
  name = "my_network"
}
