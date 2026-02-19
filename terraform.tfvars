connect_queues = [
  {
    instance_id     = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"

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
        description = "Standard business hours-test"
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
      support_queue-3 = {                                       #name of the queue will be support_queue-3
        description           = "Customer support queue"
        hours_of_operation_name = "business_hours"
        max_contacts          = 10
        status                = "ENABLED"
       # quick_connect_ids     = []

        outbound_caller_config = {
          outbound_caller_id_name      = "Support"
         # outbound_caller_id_number_id = null
         # outbound_flow_id             = null
        }
      }
      support_queue-4 = {                                       #name of the queue will be support_queue-4
        description           = "Customer support queue"
        hours_of_operation_name = "business_hours"
        max_contacts          = 10
        status                = "ENABLED"
       # quick_connect_ids     = []
        outbound_caller_config = {
          outbound_caller_id_name      = "Support"
         # outbound_caller_id_number_id = null
         # outbound_flow_id             = null
        }
      }
    }
  }
]


# terraform.tfvars
routing_profiles = [
  {
    name                        = "support-3-routing-profile"
    instance_id                 = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    routing_profile_tags        = { Environment = "dev" }
    default_outbound_queue_name = "support_queue-3"
    description                 = "Default routing profile for general agents"
    media_concurrencies = [
      { channel = "VOICE", concurrency = 1 },
      { channel = "CHAT",  concurrency = 2 }
    ]
    queue_configs = [
      {
        channel    = "VOICE"
        delay      = 0
        priority   = 1
        queue_name = "support_queue-3"
      }
    ]
    tags = { Team = "support" }
  }
]