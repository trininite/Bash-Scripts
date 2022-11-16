
#streamlink -a "--file-caching=<int> --network-caching=<int> channel(char) best"

constant="twitch.tv/"
error="Usage: <local cache ms> <net cache ms> <channel name>"


if [$1==""] || [$2==" "] || [$3==
	streamlink -a "--file-caching=$1 --network-caching=$2" $constant$3 best 
fi
