deploy:
  nh os switch

boot:
  nh os boot

test:
  nh os test

clean:
  nh clean all

up:
  nix flake update
