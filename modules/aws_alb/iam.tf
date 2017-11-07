# Add the certificate to use for HTTPS on the load balancer
resource "aws_iam_server_certificate" "load_balancer_cert" {
  name_prefix       = "${var.environment}_${var.alb_name}"
  certificate_body  = "${var.certificate_body}"
  private_key       = "${var.certificate_private_key}"
  certificate_chain = "${var.certificate_chain}"

  lifecycle {
    create_before_destroy = true
  }
}
