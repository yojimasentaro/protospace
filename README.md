#protospace DB

>about protospace:  
You can post prototypes, like them, and comment on them.

##Table  
  

    users       ：   user info  
    prototypes  ：   prototype info  
    images      ：   image info  
    likes       ：   like towards prototype  
    commnents   ：   comment on prototype  

##Associations  

```
User:  
has_many    :prototypes  
has_many    :comments  
has_many    :likes  
  
Prototype:  
belongs_to  :user
has_many    :images  
has_many    :likes  
has_many    :comments  
  
Image:  
belongs_to  :prototype

Comment:  
belongs_to  :user  
belongs_to  :prototype  
  
Like:  
belongs_to  :user  
belongs_to  :prototype  
  
```

##Columns  
###users  
|id     |username|email |password|avatar|profile|member|works |
|-------|--------|----- |--------|------|-------|------|------|
|integer|string  |string|string  |string|text   |string|string|

###prototypes  
|id     |title |catch\_copy|concept|user\_id|
|-------|------|-----------|-------|--------|
|integer|string|string     |text   |integer |

###images  
|id     |image |prototype\_id|
|-------|------|-------------|
|integer|string|integer      |

###likes  
|id     |user\_id|prototype\_id|
|-------|--------|-------------|
|integer|integer |integer      |

###comments  
|id     |user\_id|prototype\_id|comment|
|-------|--------|-------------|-------|
|integer|integer |integer      |text   |




