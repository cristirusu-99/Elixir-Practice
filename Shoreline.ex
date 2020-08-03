# Problem

# Design a data structure to represent a allowing or denying traffic by CIDR block and port range.  Describe this structure in the comments of your code.

# Implement a function that takes a set of your structures and a target cloud platform and applies these rules to the network environment of that platform.
# Please implement your solution for two of the following platforms: AWS, GCP, Azure, VMware, or Kubernetes.

# Please include answers to the following discussion questions as comments in your code:
# 1. How do you map the network rules to each platform i.e. how are the rules applied on each platform and to what types of resources on that platform?
# 2. What are the differences between the platforms from a networking perspective? How does this impact your ability to create an abstraction across the platforms?
# 3. How fine grained do you provide control over network flow? How would you go about extending this for finer grain control?  Per instance? Per group? Per network?

# If you have any clarifying questions, please email: cristina@shoreline.io

cidrBlockState = [:cidr_blocked, :cidr_allowed, :cidr_error]
              |> Enum.with_index
              |> Map.new

defmodule CIDRBlock do
  defstruct number: -1, status: cidrBlockState.cidr_error
  def constructor(), do: %CIDRBlock{}
  def constructor(blockNumber, allowanceStatus), do: %CIDRBlock{number: blockNumber, status: allowanceStatus}
  def printable(cidrBlock), do: "Block number: #{Integer.to_string(cidrBlock.number)}\nAllowance status: #{Integer.to_string(cidrBlock.status)}"
end

# eventual de facut allowance state pentru porturi
defmodule PortRange do
  defstruct minPortNumber: 0, maxPortNumber: 65535
  def constructor(), do: %PortRange{}
  def constructor(minPort, maxPort), do: %PortRange{minPortNumber: minPort, maxPortNumber: maxPort}
  def printable(portRange), do: "Minimum port number: #{Integer.to_string(portRange.minPortNumber)}\nMaximum port number: #{Integer.to_string(portRange.maxPortNumber)}"
end

IO.puts("Default PortRange:\n" <> PortRange.printable(PortRange.constructor()) <> "\n")
IO.puts("Set PortRange:\n" <> PortRange.printable(PortRange.constructor(120, 8080)) <> "\n")

IO.puts("Default CIDRBlock:\n" <> CIDRBlock.printable(CIDRBlock.constructor()) <> "\n")
IO.puts("Set CIDRBlock:\n" <> CIDRBlock.printable(CIDRBlock.constructor(24, cidrBlockState.cidr_allowed)))
