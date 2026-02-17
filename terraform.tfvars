connect_queues = [
  {
    create_instance = true
    instance_id     = null

    hours_of_operations_tags = {
      Environment = "prod"
      ManagedBy   = "terraform"
    }

    queue_tags = {
      Environment = "prod"
      ManagedBy   = "terraform"
    }

    hours_of_operations = {
      business_hours = {
        time_zone   = "US/Eastern"
        description = "Standard business hours"
        config = [
          {
            day        = "MONDAY"
            start_time = { hours = 9, minutes = 0 }
            end_time   = { hours = 17, minutes = 0 }
          },
          {
            day        = "TUESDAY"
            start_time = { hours = 9, minutes = 0 }
            end_time   = { hours = 17, minutes = 0 }
          },
          {
            day        = "WEDNESDAY"
            start_time = { hours = 9, minutes = 0 }
            end_time   = { hours = 17, minutes = 0 }
          },
          {
            day        = "THURSDAY"
            start_time = { hours = 9, minutes = 0 }
            end_time   = { hours = 17, minutes = 0 }
          },
          {
            day        = "FRIDAY"
            start_time = { hours = 9, minutes = 0 }
            end_time   = { hours = 17, minutes = 0 }
          }
        ]
      }
    }

    queues = {
      support_queue = {
        description           = "Customer support queue"
        hours_of_operation_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        max_contacts          = 10
        status                = "ENABLED"
        quick_connect_ids     = []
        tags = {
          Team = "support"
        }
        outbound_caller_config = {
          outbound_caller_id_name      = "Support"
          outbound_caller_id_number_id = null
          outbound_flow_id             = null
        }
      }
    }
  }
]