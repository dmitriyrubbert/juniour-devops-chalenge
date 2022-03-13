
# --------------- VPS --------------------------
data "aws_availability_zones" "available" {}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.common_tags, { Name = "${var.env}-vpc" })
}

# ----------------- Subnet ----------------
resource "aws_subnet" "private" {
  count                   = length(var.vpc_private_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.vpc_private_subnet_cidrs, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags                    = merge(var.common_tags, { Name = "${var.env}-public-${count.index + 1}" })
}

#===============================================
