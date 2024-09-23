#!/bin/bash
ls | tr [:lower:] [:upper:] | tr -d ["Aa"]
