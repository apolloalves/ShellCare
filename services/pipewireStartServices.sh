#!/bin/bash
# Inicia todos os serviços do PipeWire

systemctl --user enable --now pipewire.service pipewire-pulse.service wireplumber.service
systemctl --user restart pipewire.service pipewire-pulse.service wireplumber.service

