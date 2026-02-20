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
  }
]


security_profiles = [
  {
    name        = "admin-2"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    security_profile_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
    }
    description = "Admin security profile with full permissions"
    permissions = [
        "AccessMetrics",
        "AccessMetrics.AgentActivityAudit.Access",
        "AccessMetrics.Dashboards.Access",
        "AccessMetrics.DashboardsWithMyData.View",
        "AccessMetrics.HistoricalMetrics.Access",
        "AccessMetrics.RealTimeMetrics.Access",
        "AgentGrouping.Create",
        "AgentGrouping.Edit",
        "AgentGrouping.EnableAndDisable",
        "AgentGrouping.View",
        "AgentStates.Create",
        "AgentStates.Edit",
        "AgentStates.EnableAndDisable",
        "AgentStates.View",
        "AgentTimeCard.View",
        "Analytics.PerformanceMetrics.Access",
        "Audio.View",
        "AudioDeviceSettings.Access",
        "AutomatedVoiceInteraction.Recordings.Redacted.Access",
        "AutomatedVoiceInteraction.Recordings.Redacted.DownloadButton",
        "AutomatedVoiceInteraction.Recordings.Unredacted.Access",
        "AutomatedVoiceInteraction.Recordings.Unredacted.DownloadButton",
        "AutomatedVoiceInteraction.Transcripts.Redacted.Access",
        "AutomatedVoiceInteraction.Transcripts.Unredacted.Access",
        "BasicAgentAccess",
        "Bots.Create",
        "Bots.Edit",
        "Bots.View",
        "CallRecordings.Redacted.Access",
        "CallRecordings.Redacted.DownloadButton",
        "CallRecordings.Unredacted.Access",
        "CallRecordings.Unredacted.DownloadButton",
        "Campaigns.Create",
        "Campaigns.Delete",
        "Campaigns.Edit",
        "Campaigns.Manage",
        "Campaigns.View",
        "Capacity.Edit",
        "Capacity.Publish",
        "Capacity.View",
        "CaseFields.Create",
        "CaseFields.Edit",
        "CaseFields.View",
        "CaseHistory.View",
        "CaseTemplates.Create",
        "CaseTemplates.Edit",
        "CaseTemplates.View",
        "Cases.Create",
        "Cases.Edit",
        "Cases.View",
        "ChatTestMode",
        "CoachingSessions.Create",
        "CoachingSessions.Delete",
        "CoachingSessions.Edit",
        "CoachingSessions.View",
        "ConfigureContactAttributes.View",
        "ContactAttributes.View",
        "ContactFlowModules.Create",
        "ContactFlowModules.Delete",
        "ContactFlowModules.Edit",
        "ContactFlowModules.Publish",
        "ContactFlowModules.View",
        "ContactFlows.Create",
        "ContactFlows.Delete",
        "ContactFlows.Edit",
        "ContactFlows.Publish",
        "ContactFlows.View",
        "ContactLensCustomVocabulary.Edit",
        "ContactLensCustomVocabulary.View",
        "ContactLensPostContactSummary.View",
        "ContactSearch.View",
        "ContactSearchQuickViewWidget.Create",
        "ContactSearchQuickViewWidget.Delete",
        "ContactSearchQuickViewWidget.Edit",
        "ContactSearchQuickViewWidget.View",
        "ContactSearchSampleContacts.View",
        "ContactSearchWithCharacteristics.Access",
        "ContactSearchWithCharacteristics.View",
        "ContactSearchWithKeywords.Access",
        "ContactSearchWithKeywords.View",
        "ContactTranscripts.Redacted.Access",
        "ContactTranscripts.Unredacted.Access",
        "ContactTranscripts.Unredacted.DownloadButton",
        "ContentManagement.Create",
        "ContentManagement.Delete",
        "ContentManagement.Edit",
        "ContentManagement.MessageTemplates.Create",
        "ContentManagement.MessageTemplates.Delete",
        "ContentManagement.MessageTemplates.Edit",
        "ContentManagement.MessageTemplates.View",
        "ContentManagement.View",
        "CustomMetrics.Create",
        "CustomMetrics.Delete",
        "CustomMetrics.Edit",
        "CustomMetrics.Publish",
        "CustomMetrics.View",
        "CustomViews.Access",
        "CustomerProfiles.CalculatedAttributes.Create",
        "CustomerProfiles.CalculatedAttributes.Delete",
        "CustomerProfiles.CalculatedAttributes.Edit",
        "CustomerProfiles.CalculatedAttributes.View",
        "CustomerProfiles.Create",
        "CustomerProfiles.Edit",
        "CustomerProfiles.PredictiveInsights.Create",
        "CustomerProfiles.PredictiveInsights.Delete",
        "CustomerProfiles.PredictiveInsights.Edit",
        "CustomerProfiles.PredictiveInsights.View",
        "CustomerProfiles.ProfileExplorer.Create",
        "CustomerProfiles.ProfileExplorer.Delete",
        "CustomerProfiles.ProfileExplorer.Edit",
        "CustomerProfiles.ProfileExplorer.View",
        "CustomerProfiles.Segments.Create",
        "CustomerProfiles.Segments.Delete",
        "CustomerProfiles.Segments.Export",
        "CustomerProfiles.Segments.View",
        "CustomerProfiles.View",
        "DataTables.Create",
        "DataTables.Delete",
        "DataTables.Edit",
        "DataTables.View",
        "DeleteCallRecordings",
        "DownloadCallRecordings",
        "EmailAddresses.Create",
        "EmailAddresses.Edit",
        "EmailAddresses.Remove",
        "EmailAddresses.View",
        "Evaluation.Create",
        "Evaluation.Delete",
        "Evaluation.Edit",
        "Evaluation.View",
        "EvaluationAssistant.Access",
        "EvaluationCalibrationSessions.Create",
        "EvaluationCalibrationSessions.Delete",
        "EvaluationCalibrationSessions.Edit",
        "EvaluationCalibrationSessions.View",
        "EvaluationForms.Create",
        "EvaluationForms.Delete",
        "EvaluationForms.Edit",
        "EvaluationForms.View",
        "ForecastScheduleInterval.Edit",
        "ForecastScheduleInterval.View",
        "Forecasting.Edit",
        "Forecasting.Publish",
        "Forecasting.View",
        "GraphTrends.View",
        "HistoricalChanges.View",
        "HoursOfOperation.Create",
        "HoursOfOperation.Delete",
        "HoursOfOperation.Edit",
        "HoursOfOperation.View",
        "ListenCallRecordings",
        "ManagerBargeIn",
        "ManagerListenIn",
        "ManualAssignAnyContact.Enable",
        "ManualAssignMyContacts.Enable",
        "MetricsReports.Create",
        "MetricsReports.Delete",
        "MetricsReports.Edit",
        "MetricsReports.Publish",
        "MetricsReports.Schedule",
        "MetricsReports.Share",
        "MetricsReports.View",
        "MyCoachingSessions.Create",
        "MyCoachingSessions.Delete",
        "MyCoachingSessions.Edit",
        "MyCoachingSessions.View",
        "MyContacts.View",
        "OutboundCallAccess",
        "OutboundEmail.Create",
        "PhoneNumbers.Claim",
        "PhoneNumbers.Edit",
        "PhoneNumbers.Release",
        "PhoneNumbers.View",
        "PredefinedAttributes.Create",
        "PredefinedAttributes.Delete",
        "PredefinedAttributes.Edit",
        "PredefinedAttributes.View",
        "Prompts.Create",
        "Prompts.Delete",
        "Prompts.Edit",
        "Prompts.View",
        "QConnectAIAgents.Create",
        "QConnectAIAgents.Delete",
        "QConnectAIAgents.Edit",
        "QConnectAIAgents.View",
        "QConnectAIPrompts.Create",
        "QConnectAIPrompts.Delete",
        "QConnectAIPrompts.Edit",
        "QConnectAIPrompts.View",
        "QConnectGuardrails.Create",
        "QConnectGuardrails.Delete",
        "QConnectGuardrails.Edit",
        "QConnectGuardrails.View",
        "Queues.Create",
        "Queues.Delete",
        "Queues.Edit",
        "Queues.EnableAndDisable",
        "Queues.Purge",
        "Queues.View",
        "RealtimeContactLens.View",
        "RedactedData.View",
        "ReportSchedules.Create",
        "ReportSchedules.Delete",
        "ReportSchedules.Edit",
        "ReportSchedules.View",
        "ReportsAdmin.Access",
        "ReportsAdmin.Delete",
        "ReportsAdmin.Publish",
        "ReportsAdmin.Schedule",
        "ReportsAdmin.View",
        "RoutingPolicies.Create",
        "RoutingPolicies.Delete",
        "RoutingPolicies.Edit",
        "RoutingPolicies.View",
        "Rules.Create",
        "Rules.Delete",
        "Rules.Edit",
        "Rules.View",
        "RulesGenerativeAI.Create",
        "RulesGenerativeAI.Delete",
        "RulesGenerativeAI.Edit",
        "RulesGenerativeAI.View",
        "Scheduling.Edit",
        "Scheduling.Publish",
        "Scheduling.View",
        "ScreenRecording.Access",
        "ScreenRecording.Delete",
        "ScreenRecording.Download",
        "SecurityProfiles.Create",
        "SecurityProfiles.Delete",
        "SecurityProfiles.Edit",
        "SecurityProfiles.View",
        "SelfAssignContacts.Access",
        "StaffCalendar.Edit",
        "StaffCalendar.View",
        "StopContact.Enabled",
        "TaskTemplates.Create",
        "TaskTemplates.Delete",
        "TaskTemplates.Edit",
        "TaskTemplates.View",
        "TeamCalendar.Edit",
        "TeamCalendar.View",
        "TestCases.Create",
        "TestCases.Delete",
        "TestCases.Edit",
        "TestCases.Execute",
        "TestCases.Publish",
        "TestCases.View",
        "TimeOff.Approve",
        "TimeOff.Edit",
        "TimeOff.View",
        "TimeOffBalance.Edit",
        "TimeOffBalance.View",
        "Transcript.View",
        "TransferContact.Enabled",
        "TransferDestinations.Create",
        "TransferDestinations.Delete",
        "TransferDestinations.Edit",
        "TransferDestinations.View",
        "UnredactedData.View",
        "UpdateContactSchedule.Enabled",
        "Users.Create",
        "Users.Delete",
        "Users.Edit",
        "Users.EditPermission",
        "Users.EnableAndDisable",
        "Users.View",
        "VideoContact.Access",
        "Views.Create",
        "Views.Edit",
        "Views.Remove",
        "Views.View",
        "VoiceId.Access",
        "VoiceIdAttributesAndSearch.View",
        "VoiceIdUpdateSpeakerId.Access",
        "Wisdom.View",
        "Workspaces.Assign",
        "Workspaces.Create",
        "Workspaces.Delete",
        "Workspaces.Edit",
        "Workspaces.EditVisibility",
        "Workspaces.View"
    ]
  },
  {
    name        = "agent-2"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    security_profile_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
    }
    description = "Standard admin security profile"
    permissions = [
        "Analytics.PerformanceMetrics.Access",
        "BasicAgentAccess",
        "ContactSearch.View",
        "CustomViews.Access",
        "CustomerProfiles.CalculatedAttributes.Create",
        "CustomerProfiles.CalculatedAttributes.Delete",
        "CustomerProfiles.CalculatedAttributes.Edit",
        "CustomerProfiles.CalculatedAttributes.View",
        "CustomerProfiles.Create",
        "CustomerProfiles.Edit",
        "CustomerProfiles.PredictiveInsights.Create",
        "CustomerProfiles.PredictiveInsights.Delete",
        "CustomerProfiles.PredictiveInsights.Edit",
        "CustomerProfiles.PredictiveInsights.View",
        "CustomerProfiles.ProfileExplorer.Create",
        "CustomerProfiles.ProfileExplorer.Delete",
        "CustomerProfiles.ProfileExplorer.Edit",
        "CustomerProfiles.ProfileExplorer.View",
        "CustomerProfiles.Segments.Create",
        "CustomerProfiles.Segments.Delete",
        "CustomerProfiles.Segments.Export",
        "CustomerProfiles.Segments.View",
        "CustomerProfiles.View",
        "DataTables.Create",
        "DataTables.Delete",
        "DataTables.Edit",
        "DataTables.EditExpressionValues",
        "DataTables.ManageValues",
        "DataTables.View",
        "HoursOfOperation.Create",
        "HoursOfOperation.Delete",
        "HoursOfOperation.Edit",
        "HoursOfOperation.View",
        "ManualAssignAnyContact.Enable",
        "MyContacts.View",
        "OutboundCallAccess",
        "OutboundEmail.Create",
        "PredefinedAttributes.Create",
        "PredefinedAttributes.Delete",
        "PredefinedAttributes.Edit",
        "PredefinedAttributes.View",
        "Queues.Create",
        "Queues.Delete",
        "Queues.Edit",
        "Queues.EnableAndDisable",
        "Queues.View",
        "RoutingPolicies.Create",
        "RoutingPolicies.Delete",
        "RoutingPolicies.Edit",
        "RoutingPolicies.View",
        "SelfAssignContacts.Access",
        "StaffCalendar.Edit",
        "StaffCalendar.View",
        "StopContact.Enabled",
        "TaskTemplates.Create",
        "TaskTemplates.Delete",
        "TaskTemplates.Edit",
        "TaskTemplates.View",
        "TransferContact.Enabled",
        "TransferDestinations.Create",
        "TransferDestinations.Delete",
        "TransferDestinations.Edit",
        "TransferDestinations.View",
        "UpdateContactSchedule.Enabled",
        "Users.View",
        "Wisdom.View"
    ]
  },
  {
    name = "CallCenterManager-2"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    security_profile_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
  }
  permissions = [ 
        "AccessMetrics",
        "AgentStates.Create",
        "AgentStates.Edit",
        "AgentStates.EnableAndDisable",
        "AgentStates.View",
        "AgentTimeCard.View",
        "ContactAttributes.View",
        "ContactFlowModules.Create",
        "ContactFlowModules.Delete",
        "ContactFlowModules.Edit",
        "ContactFlowModules.Publish",
        "ContactFlowModules.View",
        "ContactFlows.Create",
        "ContactFlows.Delete",
        "ContactFlows.Edit",
        "ContactFlows.Publish",
        "ContactFlows.View",
        "ContactSearch.View",
        "CustomerProfiles.CalculatedAttributes.Create",
        "CustomerProfiles.CalculatedAttributes.Delete",
        "CustomerProfiles.CalculatedAttributes.Edit",
        "CustomerProfiles.CalculatedAttributes.View",
        "DeleteCallRecordings",
        "DownloadCallRecordings",
        "HoursOfOperation.Create",
        "HoursOfOperation.Edit",
        "HoursOfOperation.View",
        "ListenCallRecordings",
        "ManagerListenIn",
        "MetricsReports.Create",
        "MetricsReports.Delete",
        "MetricsReports.Edit",
        "MetricsReports.Publish",
        "MetricsReports.Schedule",
        "MetricsReports.Share",
        "MetricsReports.View",
        "PhoneNumbers.Claim",
        "PhoneNumbers.Edit",
        "PhoneNumbers.Release",
        "PhoneNumbers.View",
        "Prompts.Create",
        "Prompts.Delete",
        "Prompts.Edit",
        "Prompts.View",
        "Queues.Create",
        "Queues.Edit",
        "Queues.EnableAndDisable",
        "Queues.View",
        "ReportSchedules.Create",
        "ReportSchedules.Delete",
        "ReportSchedules.Edit",
        "ReportSchedules.View",
        "RoutingPolicies.Create",
        "RoutingPolicies.Edit",
        "RoutingPolicies.View",
        "TaskTemplates.Create",
        "TaskTemplates.Delete",
        "TaskTemplates.Edit",
        "TaskTemplates.View",
        "TransferDestinations.Create",
        "TransferDestinations.Edit",
        "TransferDestinations.View",
        "Users.EnableAndDisable",
        "Users.View"
     ]
  },
  {
    name = "QualityAnalyst-2"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    security_profile_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
  }
  permissions = [ 
        "AccessMetrics",
        "AgentTimeCard.View",
        "ContactAttributes.View",
        "ContactSearch.View"
]
  }
]


users = [
  {
    name        = "john.doe"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    user_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
    }
    identity_info = {
      email      = "john.doe@example.com"
      first_name = "John"
      last_name  = "Doe"
    }
    password = "Test@1234!" # eg Test@1234! if no password, remove this field
    phone_config = {
      phone_type                    = "SOFT_PHONE"
      after_contact_work_time_limit = 30
      auto_accept                   = false
    }
    routing_profile_name   = "support-3-routing-profile"
    security_profile_names = ["agent-2"]
  },
  {
    name        = "jane.admin"
    instance_id = "b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    user_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
    }
    identity_info = {
      email      = "jane.admin@example.com"
      first_name = "Jane"
      last_name  = "Admin"
    }
    password = "Test@1234!" # eg Test@1234! if no password, remove this field
    phone_config = {
      phone_type        = "DESK_PHONE"
      desk_phone_number = "+12345678901"
      auto_accept       = true
    }
    routing_profile_name   = "support-3-routing-profile"
    security_profile_names = ["agent-2"]
  }
]


phone_numbers = [
  {
    instance_id  = "arn:aws:connect:us-east-1:387867038403:instance/b8a0bb47-005c-4c4a-9c54-1b1937ed2613"
    phone_number_tags = {
      Environment = "dev"
      ManagedBy   = "terraform"
    }
    country_code = "US"
    type         = "DID"
    description  = "Main support line"
    #prefix       = "+1206"
    region       = "us-east-1"
  }
]