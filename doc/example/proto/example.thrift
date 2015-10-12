namespace cpp example
namespace java com.wanda.example.gen

struct UserProfile{
        1:i32 id, 
        2:string name,
        3:string blurb
} 
 
service UserStorage{
        void store(1: UserProfile user), 
        UserProfile getUser(1: i32 uid)
}

