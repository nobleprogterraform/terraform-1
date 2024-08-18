In this section, we will learn what modules are and
how to use them within our terraform configuration.

When dealing with large infrastructure projects with hundreds
of resources, we can still opt to write the configuration
with an a single file
terraform does
not impose any limit on the number of resources per
configuration file.
However, this would mean
that our configuration file will contain hundreds to
thousands of lines of code within no time.

Alternatively, we can also split the configuration into
multiple files within the configuration directory and
things will work the same way.

We saw earlier that terraform will consider every
file within the configuration directory as a configuration file
as long as it has the .tf extension.

While this would organize code a
bit better as compared to writing it all in a single configuration
file. There are still a lot of disadvantages in
following this approach when implementing terraform
this configuration severely limits the reusability.

module Is Not A New Concept and it
is something that we have been using all throughout this course.
Any configuration directory containing a set of configuration files
is called a module.

In this example we will put module code inside aws-instance directory 
where we will create a simple aws instance resource that can be reused.

our configuration directory where we will be running terraform
commands is now the development directory. It becomes
the root module and the AWS instance directory
that we are calling from within our main.tf file
is considered to be the child module.

Let us inspect the syntax of the module block closely.
We use the module keyword followed by The Logical name
of the module. In this case. We have called it Dev
web server.

Inside the module block. We have one required argument, which
is the source.
This is the path where the child module is stored.
Make a note that in this example the path for the child
module is specified as a relative path with respect to
the configuration directory or the root module

