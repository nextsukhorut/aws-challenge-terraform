resource "aws_key_pair" "ssh" {
  key_name   = var.aws_keypair_name
  public_key = var.ssh_key

  tags = local.required_tags
}
