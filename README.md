# cybergym_tasks20261013F

## 已知问题和修改

- **2026-10-28：agent 镜像不再带参考答案 `/tmp/poc` 和源码的版本历史；全部 128 个 bundle 的镜像标签改为 `v0.0.2`。**
  ARVO 原始镜像 `n132/arvo:<id>-vul` 在 `/tmp/poc` 存着这个漏洞的复现输入，和 `solution/solve.sh` 写出的标准答案逐字节相同，
  所有用户可读，平台上已有 agent 直接提交它拿到 reward=1。另外，删掉项目目录以后，`/src` 下还留着依赖库（zlib、libjpeg-turbo 等）
  或项目另一份副本（如 capstonemaster）的 git/hg 仓库；它们是 2024 年克隆的，历史一直延续到漏洞修复之后，agent 能从中翻到上游的修复提交。
  修改：`environment/Dockerfile` 在删除 `/bin/arvo`、`/src/build.sh`、`/out/*` 和项目目录那一步之后，增加 `RUN rm -f /tmp/poc` 和
  `RUN find /src \( -name .git -o -name .hg \) -prune -exec rm -rf {} +`（只删版本库元数据，源码保留，agent 照样能编译）。
  改动由 `conversion/harden_agent_dockerfile.py` 完成，以后 `convert.sh` 转换新 bundle 时也会做这一步。task-server 镜像从自己那份基础镜像构建，
  标准答案仍在它的 `/tests/ground_truth_poc`，判定不受影响。本地用 Docker 实测了 arvo-v2-783、8867、39699：新镜像里没有 `/tmp/poc`，
  `/src` 下没有 `.git`、`.hg`（旧镜像的 `/tmp/poc` 与标准答案逐字节相同；8867 旧镜像的 `/src/capstonemaster` 里能看到 2,930 个比漏洞版本新的提交）；
  783 的完整评测结果与修改前一致（标准答案 reward=1，空 PoC reward=0），在新镜像里从 `repo-vul.tar.gz` 编译 pcre2 和 fuzzer、复现崩溃都正常。
  请对本仓库的 bundle 重新运行 `build.sh` 和 `push.sh`（两个镜像都用新标签）。
