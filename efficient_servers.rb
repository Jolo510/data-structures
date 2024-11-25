# Developers want to stresstest the quality of the server channels. Ensure the following

# - Each of the packets must be sent via a single channel 
# - Each of the channels must transfer at least one packet 

# The quality of the transfer for a channel is defined by the median of the sizes of all the data packets sent through that channel.

# Find the maximum possible sum of the qualites of all channels. If the answer is a floating point value, round it to the next higher integer.

# Example 
# packetes = [1,2,3,4,5]
# channels = 2

# C1: 1 2 3 4
# C2: 5

# Quality Transfer of C1: (2+3)/2 = 2.5
# Quality Transfer of C2: 5
# 2.5 + 5 = 7.5 rounds up to 8

# Contraints
# 1 <= len(packets) <= 5 * 10^5
# 1 <= packets[1] <= 10^9
# 1 <= channels <= len(packets)

def findMaximumQuality(packets, channels)
  # Intuition 
  # - To maximize the total quality, we maximize each channel’s median.
  # - Generally, maximumzation problems lends itself to Greddy, or DP
  # - Not DP because there are no overlapping subproblems
  # -- Placing a packet in a channel makes it unvailble for future decisions
  # -- That reduces the problem BUT it's not reused
  # - Greddy works because
  # -- The highest median comes from placing the largest packets in their own channel
  # -- Adding packets that are smaller in value to a channel always lowers the value
  
  # Approach
  # - Sort the packets
  # - Place the largest packet into it's own channel and repeat until there's only 1 channel left
  # - The remainin packets will go into that channel
  # - Compute the median for the last channel
  # Note: Not actually placing packets into channels but rather computing the median and adding it to the total_quality

  # Sort the packets
  packets.sort!.reverse!

  # "Place" the largest packets into it's own channel 
  total_quality = 0
  packet_idx = 0

  while packet_idx < channels - 1
    total_quality += packets[packet_idx]
    packet_idx += 1
  end

  # Get the reminaing packets and compute the median
  remaining_packets = packets[packet_idx..-1]
  mid = remaining_packets.length / 2
  if remaining_packets.length.odd?
    total_quality += remaining_packets[mid]
  else
    total_quality += (remaining_packets[mid] + remaining_packets[mid-1]) / 2.0
  end

  total_quality.ceil
end

# Test Cases
expected = 8
actual = findMaximumQuality([1, 2, 3, 4, 5], 2)
puts "findMaximumQuality([1,2,3,4,5], 2) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Minimum input values
expected = 1
actual = findMaximumQuality([1], 1)
puts "findMaximumQuality([1], 1) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# All packets in a single channel
expected = 3
actual = findMaximumQuality([1, 2, 3, 4, 5], 1)
puts "findMaximumQuality([1,2,3,4,5], 1) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Each channel gets exactly one packet
expected = 150
actual = findMaximumQuality([10, 20, 30, 40, 50], 5)
puts "findMaximumQuality([10,20,30,40,50], 5) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Large number of packets and 2 channels
expected = 150000
actual = findMaximumQuality((1..100000).to_a, 2)
puts "findMaximumQuality((1..100000).to_a, 2) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Large packet sizes, split into three channels
expected = 2999999996
actual = findMaximumQuality([1000000000, 999999999, 999999998, 999999997, 999999996], 3)
puts "findMaximumQuality([1000000000, 999999999, 999999998, 999999997, 999999996], 3) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Single channel with odd number of packets
expected = 4
actual = findMaximumQuality([1, 2, 3, 4, 5, 6, 7], 1)
puts "findMaximumQuality([1, 2, 3, 4, 5, 6, 7], 1) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Single channel with even number of packets
expected = 4
actual = findMaximumQuality([1, 2, 3, 4, 5, 6], 1)
puts "findMaximumQuality([1, 2, 3, 4, 5, 6], 1) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Maximum input size: each packet forms its own channel
expected = 500000000000000
actual = findMaximumQuality([1000000000] * 500000, 500000)
puts "findMaximumQuality([1000000000] * 500000, 500000) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"

# Random packet sizes
expected = 28
actual = findMaximumQuality([4, 3, 7, 9, 2, 6, 1, 8, 5], 4)
puts "findMaximumQuality([4, 3, 7, 9, 2, 6, 1, 8, 5], 4) Expected: #{expected} Actual: #{actual} #{expected == actual ? 'Pass' : 'Fail'}"
