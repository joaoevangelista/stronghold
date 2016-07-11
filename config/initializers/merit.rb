# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end


observer = {id: 1, name: 'observer', description: 'Reported an issue'}
louder = {id: 2, name: 'louder', description: 'Made an announcement'}
#first_class = {id: 3, name: 'first_class', description: 'Read 10 announcements'}
opinator = {id: 4, name: 'opinator', description: 'Commented on five different issues'}
any_voice_matters = {id: 5, name: 'any_voice_matters', description: 'Commented on an issue'}
#taking_responsibility = {id: 7, name: 'taking_responsibility',
#  description: 'Be assigned ten times on issues'
#}
# ticking = {id: 8, name: 'ticking', description: 'Set due date on fifteen issues'}
watchful = {id: 9, name: 'watchful', description: 'Report tweenty issues'}
#say_yes = {id: 10, name: 'say_yes', description: 'Vote on ten issues'}
#you_say_it_you_get_it = {id: 11, name: 'you_say_it_you_get_it',
#  description: 'Close tweenty issues'
#}
#changes = {id: 12, name: 'changes', description: 'Read tweenty five announcements'}
#polishing = {id: 13, name: 'polishing', description: 'Edited tweenty five different issues'}

[observer, louder, first_class, opinator,
  any_voice_matters, taking_responsibility,
  organizer, ticking, watchful, say_yes, you_say_it_you_get_it,
  changes, polishing].each do |badge|
    Merit::Badge.create! badge
  end
