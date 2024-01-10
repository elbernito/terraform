echo " ============================================"
echo " = Enable debug                              "
echo " ============================================"

echo "Call as source ./enableDebugBash.sh"


mkdir ./.log
export TF_LOG="DEBUG"
export TF_LOG_PATH="./.log/terraform.log"

echo "done..."