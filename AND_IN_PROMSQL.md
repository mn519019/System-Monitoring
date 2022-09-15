## While creating an alert in prometheus, we would want to adopt AND operator to be more flexible with our alert rules. However, bracket and certain syntax is required to do so. 
Simple demonstrated examples are given below. 

# This will not work 
# It will only query the left side one

com_good_example_stats_comexample_examples_example_queuedNotificationsCount{instance=~"example001.*"} AND com_good_example_stats_comexample_examples_example_queuedNotificationsCount{instance=~"example001.*"} > 0

# This will work 
# This will evalualte both queries and filter out what it passes and bring the value of the left query

(
   (com_good_example_stats_comexample_examples_example_queuedNotificationsCount{instance=~"example001.*""} == 0) 
   AND
   (com_good_example_stats_comexample_examples_example_queuedNotificationsCountt{instance=~"example001.*"} > 0)
)
