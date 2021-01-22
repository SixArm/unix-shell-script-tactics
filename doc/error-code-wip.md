# Error code - work in progress

Error code list for command line interface programs. Also known as exit codes.

This is a work in progess. The intent is to define exit codes for typical needs, akin to how the HTTP specification defines HTTP status codes for typical needs.

Generic errors:

* Any error.
* Syntax error.
* Argument error.
* Enocding error.
* Parse error.
* Version error.
* Security error.

Code errors:

* Code error. Any kind.
* Exist error. Example: a item does not exist, or is nil, or unset, or undefined.
* Index error. Example: an array index is out of bounds.
* Length error. Example: a string is too short or too long.
* Number error. Example: division by zero, multiply by infinity, integer root of a negative.
* Match error: Example: two objects should match, but don't.

###

* range error. HTTP 416.
* precondition error. HTTP 412.
* dependency error. HTTP 424.
* early error. HTTP 425. The command is unwilling to risk processing a request that might be replayed.



HTTP 5xx:

* service unavailable. HTTP 503.


###

Environment errors:

* Environment error. Any kind.
* Environment variable error. Example: the program reads the `HOME` env var, but it isn't defined.
* Environment command error. Example: the program calls the `cat` command, but it isn't runnable.
* Environment interaction error. Example: the program needs to prompt, but there's no console.

Program errors:

* Program error. Any kind.
* Validation error.
* Load error. Example: cannot load a library, module, function, etc.
* Lock error. Example: cannot acquire a write lock. HTTP 423.
* Loop error. Example: infinite loop, reptitive status, etc. HTTP 508.
* IO Error. Example: unable to read a file.
* Timeout error. Example: a calculation took too long. HTTP 408.

System errors:

* System error. Any kind.
* Memory error. Example: insuffiencent RAM.
* Storage error. Example: insufficient SSD. HTTP 507.
* Thread error. Example: unable to allocate a new thread.
* Process error. Example: unable to spawn a child process.
* Signal error. Example: unable to do inter-process communication (IPC).

Accces control errors:

* Access error. Any kind. HTTP 400.
* Authentication error. Example: the user is unknown. HTTP 401.
* Authoriziation error. Example: the user is known but lacks permissions. HTTP 403.
* Accounting error. Example: the user's action lacks sufficient resources.
* Auditing error. Example: the user's action lacks sufficient verifiability.

Access enablement errors:

* Enablement error.
* Credential error. Example: the user's SSH key is missing, or malformed, or expired.
* License error. Example: the user's license key is missing, or malformed, or expired.
* Payment error. Example: the user's credit card is missing or malformed, or expired.
* Legal error. Example: the user's action would be against the law.

Service availability errors:

* Service error.
* Service not found.
* Service not available.
* Service busy error. Example: too many concurrent users.
* Service access error. Example: authentication, authorization, accounting, auditing, etc.
* Service timeout error. Example: a remote call takes too long to respond.

Service cooperation errors:

* Cooperation error. Any kind.
* Negotiation error. Example: two systems cannot agree to a data exchange format.
* Reconciliation error. Example: two systems cannot agree to an item's value.
* Synchronization error. Example: two systems cannot update their items to be equal.
* Jurisdiction error. Example: two systems cannot cooperate due to authority areas.


###

44 Not Found. The command cannot find the requested resource.
45 Not Allowed. The command is understood but cannot be used.
46 Not Acceptable.
    This response is sent when the web server, after performing server-driven content negotiation, doesn't find any content that conforms to the criteria given by the user agent.
407 Proxy Authentication Required
    This is similar to 401 but authentication is needed to be done by a proxy.
409 Conflict
    This response is sent when a request conflicts with the current state of the server.
410 Gone
    This response is sent when the requested content has been permanently deleted from server, with no forwarding address. Clients are expected to remove their caches and links to the resource. The HTTP specification intends this status code to be used for "limited-time, promotional services". APIs should not feel compelled to indicate resources that have been deleted with this status code.
411 Length Required
    Server rejected the request because the Content-Length header field is not defined and the server requires it.
413 Payload Too Large
    Request entity is larger than limits defined by server; the server might close the connection or return an Retry-After header field.
414 URI Too Long
    The URI requested by the client is longer than the server is willing to interpret.
415 Unsupported Media Type
    The media format of the requested data is not supported by the server, so the server is rejecting the request.
417 Expectation Failed
    This response code means the expectation indicated by the Expect request header field can't be met by the server.
421 Misdirected Request
    The request was directed at a server that is not able to produce a response. This can be sent by a server that is not configured to produce responses for the combination of scheme and authority that are included in the request URI.
422 Unprocessable Entity (WebDAV)
    The request was well-formed but was unable to be followed due to semantic errors.


426 Upgrade Required
    The server refuses to perform the request using the current protocol but might be willing to do so after the client upgrades to a different protocol.
428 Precondition Required
    The origin server requires the request to be conditional. This response is intended to prevent the 'lost update' problem, where a client GETs a resource's state, modifies it, and PUTs it back to the server, when meanwhile a third party has modified the state on the server, leading to a conflict.
* busy error. HTTP 429 Too Many Requests: The user has sent too many requests in a given amount of time ("rate limiting").

431 Request Header Fields Too Large
    The server is unwilling to process the request because its header fields are too large. The request may be resubmitted after reducing the size of the request header fields.

###


Server error responses

51 Not Implemented. The request method is not supported by the command and cannot be handled. The only methods that servers are required to support (and therefore that must not return this code) are GET and HEAD.
502 Bad Gateway
    This error response means that the server, while working as a gateway to get a response needed to handle the request, got an invalid response.
503 Service Unavailable
    The server is not ready to handle the request. Common causes are a server that is down for maintenance or that is overloaded. Note that together with this response, a user-friendly page explaining the problem should be sent. This responses should be used for temporary conditions and the Retry-After: HTTP header should, if possible, contain the estimated time before the recovery of the service. The webmaster must also take care about the caching-related headers that are sent along with this response, as these temporary condition responses should usually not be cached.
 
510 Not Extended
    Further extensions to the request are required for the server to fulfil it.
511 Network Authentication Required
    The 511 status code indicates that the client needs to authenticate to gain network access. 



### Ruby standard errors

    
    ClosedQueueError
    EndOfFileError
    FiberError
    FloatDomainError
    FrozenError
    KeyError
    LocalJumpError
    SerializableError
    MathError
    MutexError
    NameError
    NoMethodError
    NotImplementedError
    RangeError
    RegexpError
    ScriptError
    SyntaxError
    SystemCallError
    SystemStackError
    TimeError
    TypeError
    UncaughtThrowError
