#!/bin/bash
echo IP=$(hostname -I | cut -f1 -d' ') >> .env