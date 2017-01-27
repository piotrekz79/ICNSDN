tshark -r 10pings.pcapng -Y "ndn.namecomponent" -e frame.number -e ndn.namecomponent -T fields -E header=y

