module "security_group_ssh" {
    source = "terraform-aws-modules/security-group/aws/modules/ssh"
    version= "3.16.0"
    vpc_id = "vpc_7d8d215"
    ingress_cidr_blocks = ["10.10.0.0/16"]
    name = "ssh-access"

}


As we discussed one of the advantages of
using modules is that it can be easily shared with others.
Earlier in the lectures about providers. We saw that
the terraform registry is used to provide a plugins
such as the ones used by AWS.

Besides the provider plugins. The registry is
also used as a public repository that stores
modules.

The modules enter from registry are group
based on the provider for which they are created and they
are available for anyone to use to provision infrastructure. They
can be categorized into two types A verified
module and the community module.

To make use of this module in our configuration we can make
use of the module block that we have seen before.

But the value for the source argument would change as the module
is no longer local.

For example to create a security group that
allows inbound SSH we can create a configuration
with the SSH sub module like this.

From the documentation for this submodule. We can
see that it requires three mandatory arguments the name
of the security group The VPC to create
it in and the Ingress cider blocks which accepts a
list of IP address ranges from which SSH is
to be allowed.

In order to make use of this module we can either
run terraform init or if the
provider plugins have already been downloaded in the configuration directory.
We can simply run the terraform get command that
will only download the module from the registry.

It is usually a good idea to specify the version of the
module as there can be many revisions that are made
to each module over time.
Not specifying the version will always download the latestx
version of the module from the registry.