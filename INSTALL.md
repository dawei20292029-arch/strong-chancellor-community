# 安装说明

## 获取文件

下载 [V1.0 发布包](https://github.com/dawei20292029-arch/strong-chancellor-community/releases/tag/v1.0.0)，解压并打开包含 `SKILL.md` 的目录。GitHub 的 Code → Download ZIP 也可使用，解压目录名可以不同。

## 安装到 Codex

在该目录打开终端，运行对应命令。需要已有 Codex 桌面版或 CLI，安装脚本本身不联网、不安装其他软件。

Windows PowerShell：

```powershell
powershell -NoProfile -File .\install.ps1
```

macOS / Linux 示例：

```bash
sh ./install.sh
```

默认使用用户目录下 `.codex/skills`；设置过 `CODEX_HOME` 时使用该目录下的 `skills`。脚本遇到同名目录会停止，保留旧文件。Windows 5.1 和 Git Bash 已实测，原生 macOS / Linux 待验证。

若 Windows 提示脚本执行受限，可手动创建上述 `skills` 目录，把含 `SKILL.md` 的文件夹复制进去，并命名为 `strong-chancellor-community`；目标同名文件夹存在时先按下面的升级说明处理。

## 验证

开启一个新 Codex 会话，必要时重启 Codex。最终结构应是 `skills/strong-chancellor-community/SKILL.md`，中间没有第二层同名文件夹。

安装后提出：

```text
启动最强丞相社区版。我正在考虑一个投入较大的新项目，但关键需求还没有用户验证。请不要顺着我，给出质疑、最小实验、指标和停止条件。
```

合格响应至少应做到：

- 指出一个关键假设；
- 区分事实与假设；
- 给出可执行的最小验证；
- 明确指标、反馈时间和停止条件。

## 升级与卸载

升级前把旧目录备份并移到 `skills` 之外，再运行新版本安装脚本。需要回滚时，把新版移出 `skills` 并恢复旧目录。卸载时将该 Skill 文件夹移出 `skills` 并重启 Codex。

不要把私人案例、业务材料或访问密钥提交到公共仓库或 Issues。
