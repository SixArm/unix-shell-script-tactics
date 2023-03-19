# awk match_between

To do a POSIX awk match between two strings:

```awk
function match_between(s, open, shut){
    open_index=index(s, open)
    if (open_index>0){
        open_length=length(open)
        RSTART=open_index+open_length
        shut_index=index(substr(s, RSTART), shut)
        if (shut_index>0){
            RLENGTH=shut_index-1
            return RSTART
        }
    }
    return 0
}
```
