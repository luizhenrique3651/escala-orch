#!/bin/bash
# kill-tunnel.sh - Encerra o túnel SSH se ele estiver travado
pkill -f "ssh -L 5432:localhost:5432"
echo "🛑 Túneis SSH encerrados."