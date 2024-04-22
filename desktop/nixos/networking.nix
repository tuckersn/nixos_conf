{ pkgs ? import <nixpkgs> {} }:

let 
  vars = builtins.fromTOML (builtins.readFile ../conf/vars.toml);
in {
  networking.hostName = vars.hostName;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [22];
}
