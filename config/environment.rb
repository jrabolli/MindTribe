# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MindTribe::Application.initialize!

#Formatting DateTime to look like "20/01/2011 10:28PM"  
#Time::DATE_FORMATS[:default] = "%d/%m/%Y %l:%M%p"  
Time::DATE_FORMATS[:default] = "%m/%d/%Y %l:%M%p"  
