#!/bin/bash

URL="https://iit.com.ua/download/productfiles/CACertificates.p7b"
DEST_DIR="/var/certificates"
DEST_FILE="${DEST_DIR}/CACertificates.p7b"
TEMP_FILE="${DEST_DIR}/temp.p7b"

# Download the file to a temporary location
curl -o "${TEMP_FILE}" "${URL}"

# Check if the file has changed
if ! cmp -s "${TEMP_FILE}" "${DEST_FILE}"; then
    echo "File has changed, updating..."
    mv "${TEMP_FILE}" "${DEST_FILE}"
else
    echo "File has not changed."
    rm "${TEMP_FILE}"
fi

CA_URL="https://iit.com.ua/download/productfiles/CAs.json"
CA_DEST_DIR="/var/certificates"
CA_DEST_FILE="${CA_DEST_DIR}/CAs.json"
CA_TEMP_FILE="${CA_DEST_DIR}/CAs.temp.json"

# Download the file to a temporary location
curl -o "${CA_TEMP_FILE}" "${CA_URL}"

# Check if the file has changed
if ! cmp -s "${CA_TEMP_FILE}" "${CA_DEST_FILE}"; then
    echo "File has changed, updating..."
    mv "${CA_TEMP_FILE}" "${CA_DEST_FILE}"
else
    echo "File has not changed."
    rm "${CA_TEMP_FILE}"
fi
