resource "aws_lightsail_instance" "test_server" {
  name              = "test-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  user_data         = "sudo yum install httpd -y && sudo systemctl start httpd && sudo systemctl enable httpd && echo '<h1>This server is created using terraform </h1>' | sudo tee /var/www/html/index.html"
}

output "public_ip" {
  value = aws_lightsail_instance.test_server.public_ip_address
}