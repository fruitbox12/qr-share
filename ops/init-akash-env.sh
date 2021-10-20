#!/bin/bash

export AKASH_ACCOUNT_ADDRESS="$(akash keys show $AKASH_KEY_NAME -a)"
echo -e "\nAKASH account address: $AKASH_ACCOUNT_ADDRESS"

export AKASH_NET="https://raw.githubusercontent.com/ovrclk/net/master/mainnet"
export AKASH_VERSION="$(curl -s "$AKASH_NET/version.txt")"
export AKASH_CHAIN_ID="$(curl -s "$AKASH_NET/chain-id.txt")"
export AKASH_NODE="$(curl -s "$AKASH_NET/rpc-nodes.txt" | head -1)"

echo -e "\n[ AKASH configuration check ]"
echo $AKASH_NODE $AKASH_CHAIN_ID $AKASH_KEYRING_BACKEND

akash q bank balances --node $AKASH_NODE $AKASH_ACCOUNT_ADDRESS


# AKASH_DSEQ=3084019
AKASH_PROVIDER=akash1nxq8gmsw2vlz3m68qvyvcf3kh6q269ajvqw6y0

8lk8u6lli1asb290eq9mpjih48.provider.akash.nixaid.com


akash query market lease list \
    --owner $AKASH_ACCOUNT_ADDRESS \
    --dseq $AKASH_DSEQ \
    -o json \
  | jq -r '.leases[] | [ (.lease | (.lease_id | .provider, .owner, .dseq, .gseq, .oseq), (.price.amount|tonumber), .state), (.escrow_payment | .state, (.balance.amount, .withdrawn.amount)) ] | @csv'