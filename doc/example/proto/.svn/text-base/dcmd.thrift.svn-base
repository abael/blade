namespace cpp dcmd
namespace java wanda.dcmd
namespace py wanda.dcmd
struct ErrCode{
   1: i32     ret_code,
   2: string  err_msg
}

struct Node{
   1: string  ip,
   2: string  user,
   3: string  create_time
}

struct Nodes{
   1:ErrCode    status,
   2:list<Node> nodes
}

struct SvrPool {
  1: string        name,
  2: i32           group=0,
  3: string        user,
  4: string        create_time
}

struct SvrPools{
  1:ErrCode    status,
  2:list<SvrPool>  pools
}

struct TaskTmplt{
   1: string       name,
   2: i32          group=0,
   3: string       build_script,
   4: string       svn_tag,
   5: string       online_script,
   6: string       target,
   7: string       svr_pool,
   8: i32          fail_host=0,
   9: i32          fail_rate=0,
   10:string       user,
   11:string       create_time,
   12:string       update_time
}

struct TaskTmpls{
   1:ErrCode    status,
   2: list<TaskTmplt>  tmplts
}

enum TaskType {
  NEW = 1,
  ROLLBACK = 2,
  REDO = 3
}
enum TaskState{
  WAITING = 0,
  RUNNING = 1,
  FAIL    = 2,
  FINISH  = 3, 
  ALL     = 4
}

struct Task{
  1: string         name,
  2: i32            group=0,
  3: string         tmpl_name,
  4: i32            priority,
  5: string         svr_pool,
  6: string         build_script;
  7: string         svn_tag,
  8: string         online_script,
  9: string         target,
 10: i32            fail_host,
 11: i32            fail_rate,
 12: TaskType       task_type,
 13: string         source_task,
 14: string         task_file,
 15: TaskState      state=TaskState.WAITING,
 16: string         errmsg,
 17: string         user,
 18: string         create_time,
 19: string         update_time
}

struct Tasks{
  1:ErrCode    status,
  2:list<Task>     tasks
}

struct TaskDetail{
  1:ErrCode      status,
  2:Task         task,
  3:list<string> undo_host,
  4:list<string> doing_host,
  5:list<string> fail_host,
  6:list<string> finish_host
}

service DcmdSvr{
   /**
   * create pool
   */
   ErrCode CreatePool(1:string pool, 2:i32 group, 3:string user),
   /**
   * delete pool
   */
   ErrCode DelPool(1:string pool),
   /**
   * add pool node
   */
   ErrCode AddPoolNodes(1:string pool, 2:list<string> ips, 3:string user),
   /**
   * delete pool node
   */
   ErrCode DelPoolNodes(1:string pool, 2:list<string> ips, 3:string user),

   /**
   * get pool list.
   */
   SvrPools GetPools(1:string pool, 2:i32 group, 3:i32 start, 4:i32 num),
   /**
   * get pool nodes
   */
   Nodes GetPoolNode(1:string pool, 2:string ip, 3:i32 start, 4:i32 num),
   /**
   * create template
   */
   ErrCode CreateTemplate(1:TaskTmplt tmplt),
   /**
   * delete template
   */
   ErrCode DelTemplate(1:string name),
   /**
   * update template
   */
   ErrCode UpdateTemplate(1:TaskTmplt tmplt),
   /**
   * query template
   */
   TaskTmpls GetTemplate(1:string name, 2:i32 group, 3:string target, 4:i32 start, 5:i32 num),
   /**
   * create task
   */
   ErrCode CreateTask(1:string task_name, 2:string tmplt_name, 3:string svr_pool, 4:i32 priority, 5:i32 group, 6:string user),
   /**
   * rollback task
   */
   ErrCode RollbackTask(1:string task_name, 2:string rollback_task_name, 3:i32 priority, 4:i32 group, 5:string user),
   /**
   * redo task
   */
   ErrCode RedoTask(1:string task_name, 2:string redo_task_name, 3:i32 priority, 4:i32 group, 5:string user),
   /**
   * cancel task
   */
   ErrCode CancelTask(1:string task_name, 2:string user),
   /**
   * query task
   */
   Tasks GetTask(1:string task_name, 2:i32 group, 3:string tmplt_name, 4:string target, 5:TaskState state, 6:string user, 7:i32 start, 9:i32 num),
   /**
   * query task detail
   */
   TaskDetail GetTaskDetail(1:string task_name, 2:bool is_undo, 3:bool is_doing, 4:bool is_fail, 5:bool is_finish)
}
