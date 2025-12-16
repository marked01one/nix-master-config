# Blocky is a DNS proxy and ad-blocker for the local network written in Go.
# Docs: https://0xerr0r.github.io/blocky/latest

{ config, pkgs, ... }:

{
  services.blocky = {
    enable = true;
    settings = {
      ports.dns = 53;
      upstreams.groups.default = [
        # Using Cloudflare's DNS over HTTPS server for resolving queries.
        "https://one.one.one.one/dns-query"
      ];
      # For initially solving DoH/DoT Requests when no system Resolver is available.
      bootstrapDns = {
        upstream = "https://one.one.one.one/dns-query";
        ips = [ "1.1.1.1" "1.0.0.1" ];
      };
      # Enable Blocking of certain domains.
      blocking = {
        denylists = {
          # Adblocking
          ads = [
            "http://sysctl.org/cameleon/hosts"
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt"
            "https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt"
          ];
          # Block sources of fake news.
          fake-news = [
            "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews/hosts"
          ];
        };
      };
      # Enable caching and prefetching of DNS requests.
      caching = {
        minTime = "5m";
        maxTime = "30m";
        prefetching = true;
      };
    };
  };
}
