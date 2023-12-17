
# VPCs

I am completely new to VPCs so let's figure these out.

First let's talk about IPs and bits:

## IP address and bit review:
Let's break down how 192.168.1 in a Class C IPv4 address is represented as 24 bits.

An IPv4 address consists of 32 bits, divided into four octets (each octet is 8 bits). To show that 192.168.1 is 24 bits, we convert each part of this address from decimal to binary:

192 in Binary: The decimal number 192 is represented in binary as 11000000. This is 8 bits.
168 in Binary: The decimal number 168 is represented in binary as 10101000. This is another 8 bits.
1 in Binary: The decimal number 1 is represented in binary as 00000001. This is yet another 8 bits.

Let's put them together:

The first octet, 192, in binary is 11000000.
The second octet, 168, in binary is 10101000.
The third octet, 1, in binary is 00000001.
So, 192.168.1 in binary is:

11000000.10101000.00000001

This is a sequence of 24 bits (8 bits per octet × 3 octets). The Class C address uses these first 24 bits as the network portion, with the remaining 8 bits (the fourth octet) used for host addresses within that network.

## Explain the components of 192.168.0.0/16

The notation 192.168.0.0/16 is an example of CIDR (Classless Inter-Domain Routing) notation, which is used to describe a range of IP addresses in IPv4 networking. Let's break down what this notation means:

Understanding 192.168.0.0/16
IP Address: 192.168.0.0 is the base IP address for the network.

CIDR Suffix (/16): The /16 indicates the number of bits used for the network portion of the address. In this case, 16 bits are used for the network identifier.

### How Many Bits?

An IPv4 address is composed of 32 bits in total.
In 192.168.0.0/16, the first 16 bits are fixed for the network part, and the remaining 16 bits are available for host addresses.
How Many Networks?
The 192.168.0.0/16 notation doesn't inherently tell us how many sub-networks (subnets) are available; it tells us the size of the address space.
Within this address space, the number of subnets you can create depends on how you choose to divide the remaining 16 bits for hosts.
How Many Hosts?
With 16 bits available for host addresses (since 32 total bits - 16 network bits = 16 host bits), you can theoretically have 2^16 host addresses.
However, in practice, 2 addresses are reserved in each subnet (network address and broadcast address), so the actual number of usable addresses is 2^16 - 2.

### Why /16?

The choice of a /16 subnet mask allows for a large number of host addresses. It's often used for larger networks where a significant number of IP addresses are needed.
This subnet mask is particularly common in private networks, where a wide range of IP addresses is required for internal devices.
Example
In the 192.168.0.0/16 network, you have a block of IP addresses ranging from 192.168.0.0 to 192.168.255.255. This block includes 65,536 IP addresses (2^16), of which 65,534 can typically be assigned to devices.


## CIDRs
- IP addresses enable resources in your VPC to communicate with each other, and with resources over the internet.
Classless Inter-Domain Routing (CIDR) notation is a way to represent an IP address and its network mask. The format of these addresses is as follows:
An individual IPv4 address is 32 bits, with 4 groups of up to 3 decimal digits. For example, 10.0.1.0.
An IPv4 CIDR block has four groups of up to three decimal digits, 0-255, separated by periods, followed by a slash and a number from 0 to 32. For example, 10.0.0.0/16.

- Classless or Classless Inter-Domain Routing (CIDR) addresses use variable length subnet masking (VLSM) to alter the ratio between the network and host address bits in an IP address. A subnet mask is a set of identifiers that returns the network address’s value from the IP address by turning the host address into zeroes. 

A VLSM sequence allows network administrators to break down an IP address space into subnets of various sizes. Each subnet can have a flexible host count and a limited number of IP addresses. A CIDR IP address appends a suffix value stating the number of network address prefix bits to a normal IP address.

## So why CIDR?

CIDR (Classless Inter-Domain Routing) is considered flexible, especially when compared to the older classful IP addressing system, because it allows for a more efficient and customizable allocation of IP addresses. Let's delve into why it's flexible, even though we still allocate a certain number of bits for the host portion:

Variable-Length Subnet Masks
Customizable Subnet Sizes: CIDR allows for the creation of subnets with variable-length subnet masks. This means that the division between the network and host portion of an IP address isn't fixed, as it was in classful addressing. Instead, you can tailor the size of the subnet to the specific needs of a network.

Efficient Use of IP Space: With classful addressing, network administrators were forced to choose from a limited set of subnet sizes (Class A, B, C), often leading to either a shortage or a wastage of IP addresses. CIDR, on the other hand, allows for much finer control over the allocation of IP addresses, reducing wastage.

Example of Flexibility
Suppose an organization needs 500 IP addresses. Under the classful system, they would have to opt for a Class B address, which provides up to 65,536 addresses, most of which would be wasted. With CIDR, they can choose a subnet like /23 (providing 2^(32-23) = 512 addresses), which closely matches their requirements.
Efficient Routing
Aggregation of Routes: CIDR enables the aggregation of several IP addresses into a smaller number of routing table entries, known as route summarization. This reduces the size of routing tables and improves the efficiency of the Internet's routing system.

More Effective Use of IP Address Ranges: CIDR allows multiple subnets to be grouped into a larger address block (supernetting). This can simplify network management and routing.

Example of Efficient Routing
In an organization with several subnets, instead of having a routing table entry for each subnet, CIDR allows for a single entry that covers multiple subnets if they are contiguous and part of a larger network block.
