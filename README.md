# Terraform AWS ElastiCache

## Functional
* Setup elasticache redis service
* Multi-AZ (2 available zones)
* Automatic Failover

## Usage

### 1. Clone this repo
```
git clone https://github.com/intens1ty/tf.aws.elasticache
```

### 2. Export credentials
```
export AWS_ACCESS_KEY_ID=()
export AWS_SECRET_ACCESS_KEY=()
```

### 3. Set up variables in variables.tf
* region
* vpc_id 
* vpc_cidr_block
* availability_zone_1
* availability_zone_2
* cidr_block_1
* cidr_block_2
* redis_node_type 

### 4. Set up parameters in parameter.tf
All available parameters for ElastiCache see in AWS documentation

### 5. Start Terraform init
```
terrafotm init
```

### 6. Start Terraform plan
```
terrafotm plan
```

### 7. Start Terraform apply
```
terrafotm apply
```

### 7. (Optional) If you want to remove all this changes from aws - start destroy
```
terrafotm destroy
```