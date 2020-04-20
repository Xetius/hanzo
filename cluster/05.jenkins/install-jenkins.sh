#!/usr/bin/env bash

helm upgrade --install jenkins stable/jenkins -f values.yml

