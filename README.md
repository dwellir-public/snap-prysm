# snap-prysm

Note: This is work in progress.

## Starting a beacon-node

Make sure you have a running execution client at http://localhost:8551

* See: https://snapcraft.io/reth

* See: https://snapcraft.io/besu

* See: https://snapcraft.io/lighthouse

* See: https://snapcraft.io/erigon

```
export recipient_addr="My reciepient address for validator rewards"

prysm beacon-chain \
   --execution-endpoint=http://localhost:8551 \
   --jwt-secret=/var/snap/prysm/common/jwt.hex \
   --suggested-fee-recipient=${recipient_addr} \
   --checkpoint-sync-url=https://beaconstate.ethstaker.cc \
   --genesis-beacon-api-url=https://beaconstate.ethstaker.cc

```
