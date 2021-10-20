# QR share

Instantly share files by uploading and getting publicly available URL as a QR code

## AWS Lambda API Gateway

`https://7q8tlppf6l.execute-api.eu-central-1.amazonaws.com/default/getPreSignedUploadUrl`

## AKASH

### Get my deplyement

```bash
akash q deployment get --dseq=3077316 --owner=akash1wl9c7jawvptt9xsx3ac58jt5lnwdxayk905fad
```

### Create deployment

```bash
akash tx deployment create deploy.yaml --from $AKASH_KEY_NAME --node $AKASH_NODE --chain-id $AKASH_CHAIN_ID --fees 5000uakt -y
```

### View market bids

```bash
akash query market bid list --owner=$AKASH_ACCOUNT_ADDRESS --node $AKASH_NODE --dseq $AKASH_DSEQ
```

### Create lease

```bash
akash tx market lease create --chain-id $AKASH_CHAIN_ID --node $AKASH_NODE --owner $AKASH_ACCOUNT_ADDRESS --dseq $AKASH_DSEQ --gseq $AKASH_GSEQ --oseq $AKASH_OSEQ --provider $AKASH_PROVIDER --from $AKASH_KEY_NAME --fees 5000uakt
```

### Confirm lease

```bash
akash query market lease list --owner $AKASH_ACCOUNT_ADDRESS --node $AKASH_NODE --dseq $AKASH_DSEQ
```


### Send manifest

```bash
akash provider send-manifest deploy.yaml --node $AKASH_NODE --dseq $AKASH_DSEQ --provider $AKASH_PROVIDER --home ~/.akash --from $AKASH_KEY_NAME
```


### Get the deployment URL

```bash
akash provider lease-status --node $AKASH_NODE --home ~/.akash --dseq $AKASH_DSEQ --from $AKASH_KEY_NAME --provider $AKASH_PROVIDER
```


### Update deployment

1. `akash tx deployment update deploy.yaml --dseq $AKASH_DSEQ --from $AKASH_KEY_NAME --chain-id $AKASH_CHAIN_ID --node $AKASH_NODE --fees=5000uakt`
2. `akash provider send-manifest deploy.yaml --keyring-backend $AKASH_KEYRING_BACKEND --node $AKASH_NODE --from $AKASH_KEY_NAME --provider $AKASH_PROVIDER --dseq $AKASH_DSEQ --log_level info --home ~/.akash`


### Get logs

`akash --node "$AKASH_NODE" provider lease-logs --dseq "$AKASH_DSEQ" --gseq "$AKASH_GSEQ" --oseq "$AKASH_OSEQ" --provider "$AKASH_PROVIDER" --follow --from "$AKASH_KEY_NAME"`


### Close deployment

```bash
akash tx deployment close \
  --node $AKASH_NODE \
  --chain-id $AKASH_CHAIN_ID \
  --dseq $AKASH_DSEQ \
  --owner $AKASH_ACCOUNT_ADDRESS \
  --from "$AKASH_KEY_NAME" \
  --gas-prices="0.025uakt" --gas="auto" --gas-adjustment=1.15
```