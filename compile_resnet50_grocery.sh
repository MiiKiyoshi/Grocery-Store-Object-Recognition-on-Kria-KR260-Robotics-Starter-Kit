#!/bin/bash

# Script name: compile_model.sh

# Log file configuration
LOG_FILE="./logs/compile_log.txt"

# Log function
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Check and create log directory
mkdir -p ./logs

# Start compilation
log "Starting model compilation for KR260 FPGA"

# Execute compilation command and log the output (to console and file simultaneously)
vai_c_tensorflow2 --model ./quant_model/quantized_resnet50_grocery.h5 \
                  --arch ./kr260.json \
                  --output_dir ./compiled_model \
                  --net_name compiled_resnet50_grocery 2>&1 | tee -a "$LOG_FILE"

# Check compilation result
if [ $? -eq 0 ]; then
    log "Model compilation completed successfully"
    log "Compiled model saved in ./compiled_model"
else
    log "Model compilation failed. Check the log file for details."
    exit 1
fi

log "Compilation process finished"
