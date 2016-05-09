#protospace DB

>about protospace:  
You can post prototypes, like them, and comment on them.

##Table  
  

    users                 ：   user info  
    prototypes            ：   prototype info  
    prototype_images      ：   image info  
    likes                 ：   like towards prototype  
    commnents             ：   comment on prototype  

##Associations  

```
User:  
has_many    :prototypes  
has_many    :comments  
has_many    :likes  
  
Prototype:  
belongs_to  :user
has_many    :prototype_images  
has_many    :likes  
has_many    :comments  
  
Prototype_image:  
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
|id     |title |catch\_copy|concept|user\_id   |
|-------|------|-----------|-------|-----------|
|integer|string|string     |text   |references |

###prototype_images  
|id     |content |prototype\_id|
|-------|--------|-------------|
|integer|string  |references   |

###likes  
|id     |user\_id  |prototype\_id|
|-------|----------|-------------|
|integer|references|references   |

###comments  
|id     |user\_id  |prototype\_id|content|
|-------|----------|-------------|-------|
|integer|references|references   |text   |




