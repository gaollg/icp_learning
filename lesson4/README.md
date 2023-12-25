# 09
作业1：把 Message 类型改为一个记录结构，并在里面添加 time 字段，记录发消息的时间。
要求：
1）提交主程序源代码并部署应用到主网提交链接（2 分）
2）正确定义了新的 Message 的记录结构 （1 分）
3）在 post 方法中，创建了新 Message 并记录了当前时间 （1 分）

<https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.icp0.io/?id=d7o2t-nyaaa-aaaan-qlkfq-cai>

# 10

作业2：：修改 posts 和 timeline 方法，仅返回指定时间之后的内容：
import Time "mo:base/Time";
func posts(since: Time.Time): async [Message] {…};
func timeline(since: Time.Time): async [Message] {…};
要求：
1）提交主程序源码并部署应用到主网提交链接（2 分）
2）正确实现了按指定时间筛选消息的功能 （2 分）

<https://a4gq6-oaaaa-aaaab-qaa4q-cai.raw.icp0.io/?id=d7o2t-nyaaa-aaaan-qlkfq-cai>

## 11
思考题：如果关注对象很多，运行 timeline 就会比较慢，有什么办法可以提高效率？
要求：
1）用文字描述一个解决方案 （1分）
2）可行性评估（1分）


有两种方案可做：

- 1、定时器抓取各个容器博客内容，timeline 请求时直接使用缓存。缺点是存储需要收费，成本较高，其次缓存刷新期内，更新不及时；优点是，可以备份博文内容，再也不用担心丢失了。

- 2、timeline 慢的原因是同步抓取其它容器博客内容，可在前端优化，使用 Promise.all([fetch(id: Principal), fetch(id2: Principal)]) 并行抓取，也可实现加快打开速度。