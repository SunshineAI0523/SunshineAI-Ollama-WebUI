# DockerImagesTarbuilder

一个用于拉取和打包 Docker 镜像的工具集，支持多架构（AMD64/ARM64/ARM32）镜像的获取和打包。

## 功能特点

- 支持多架构 Docker 镜像的拉取和打包:
  - x86-64 (AMD64)
  - ARM64
  - ARM32 (ARMv7)
- 支持批量处理多个镜像
- 自动压缩打包为 tar.gz 格式
- 基于 GitHub Actions 自动化工作流
- 支持自定义镜像列表
- 自动清理中间文件

## 使用方法

1. Fork 本仓库到你的 GitHub 账号下
2. 在 Actions 页面中选择需要的架构工作流:

   - `x86-64 Pull and Save Docker Image`
   - `ARM64 Pull and Save Docker Image`
   - `ARM32 Pull and Save Docker Image`
3. 点击 "Run workflow"，在弹出的输入框中填写需要拉取的 Docker 镜像名称

   - 多个镜像用英文逗号分隔
   - 格式示例: `alpine:latest,ubuntu:latest,nginx:stable`
4. 工作流执行完成后，可以在 Artifacts 中下载打包好的镜像文件:

   - x86-64 架构: `x86-64-images.tar.gz`
   - ARM64 架构: `arm64-images.tar.gz`
   - ARM32 架构: `arm32-images.tar.gz`

## 文件说明

- `.github/workflows/amd64.yml` - x86-64 架构镜像打包工作流
- `.github/workflows/arm64.yml` - ARM64 架构镜像打包工作流
- `.github/workflows/arm32.yml` - ARM32 架构镜像打包工作流
- `_worker.js` - Cloudflare Worker 代理脚本，用于优化镜像拉取

## 注意事项

1. 生成的压缩包默认保留 1 天，最多可设置保留 90 天
2. 为了节省 GitHub Actions 空间，工作流会自动清理中间文件
3. 建议合理控制单次拉取的镜像数量，避免超出 GitHub Actions 的限制
4. 如果遇到拉取失败，可以尝试使用代理或者更换镜像源

## 贡献

欢迎提交 Issue 和 Pull Request 来帮助改进这个项目。

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 相关项目

- Docker Hub: https://hub.docker.com/
- GitHub Actions: https://github.com/features/actions
- Cloudflare Workers: https://workers.cloudflare.com/
