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
