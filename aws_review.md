# Policies

You manage access in AWS by creating policies and attaching them to IAM identities (users, groups of users, or roles) or AWS resources. A policy is an object in AWS that, when associated with an identity or resource, defines their permissions. AWS evaluates these policies when an IAM principal (user or role) makes a request. Permissions in the policies determine whether the request is allowed or denied. Most policies are stored in AWS as JSON documents. 

An AWS IAM policy defines the permissions of an identity (users, groups, and roles) or resource within the AWS account. An AWS IAM policy regulates access to AWS resources to help ensure that only authorized users have access to specific digital assets. Permissions defined within a policy either allow or deny access for the user to perform an action on a specific resource. IAM policies can either be identity-based or resource-based. Identity-based policies are attached to an identity (a user, group, or role) and dictate the permissions of that specific identity. In contrast, a resource-based policy defines the permissions around the specific resource—by specifying which identities have access to a specific resource and when.

# Roles
Roles are designed so that a set of permissions can easily be delegated to users on an individual basis. For example, instead of assigning an individual all their necessary permissions one at a time, they can be assigned a specific role that contains all the necessary permissions in a single step. 

Once a role is created, it can be assigned to as many individuals as needed. This makes roles particularly useful when assigning permissions to new users or changing permissions to users who have shifted jobs within their organization.

Example of an AWS IAM Role 
An organization undergoes major expansion to undertake a new project: new employees are coming in, and current employees are shifting positions laterally within the organization. The current employees no longer need access to some of their old permissions but need access to new permissions. Additionally, the new employees need access to a wide variety of permissions to do their jobs. In order to accommodate this rapid new growth, IT administrators need a way to quickly and easily control access to their cloud resources while keeping their infrastructure secure.

Enter AWS IAM roles. Administrators create roles that are tied to specific policies that are appropriate for the new project. Employees—both current and new employees—can then be easily assigned to their new roles so that they only have access to what their new positions require. 


# User vs role
An IAM user is a single person or service entity/application that interacts with AWS resources through service requests and modifications. AWS users consist of a name, password, and a pair of unique API access keys that grant them permissions according to policy condition criteria established by an administrator. 

The difference between an IAM role and a user is that a role can be temporarily or permanently applied to a user to give the user bulk permissions for a task. Unlike a user, a role does not have associated passwords or credentials and can be easily applied to multiple users to grant access to a set of permissions at once. 


# Temporary creds advantages through STS
You can use the AWS Security Token Service (AWS STS) to create and provide trusted users with temporary security credentials that grant access to your AWS resources. Temporary security credentials work almost identically to the long-term access key credentials that you provide for your IAM users, with the following differences:

Temporary security credentials are for short-term use. You can configure the amount of time that they are valid, from 15 minutes up to a maximum of 12 hours. After temporary credentials expire, AWS does not recognize them or allow any kind of access from API requests made with them.

Temporary security credentials are not stored with the user. Instead, they are generated dynamically and provided to the user when requested. When (or before) temporary security credentials expire, a user can request new credentials, if that user has permissions to do so.

These differences provide the following advantages when you use temporary credentials:

You do not have to distribute or embed long-term AWS security credentials with an application.

Temporary credentials are the basis for roles and identity federation. You can provide access to your AWS resources to users by defining a temporary AWS identity for them.

Temporary security credentials have a limited customizable lifespan. Because of this, you do not have to rotate them or explicitly revoke them when they're no longer needed. After temporary security credentials expire, they cannot be reused. You can specify the maximum amount of time the credentials are valid.
