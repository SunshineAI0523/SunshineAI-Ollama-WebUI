# SunshineAI Ollama WebUI


这是一个基于 Docker 快速部署Ollama和Open-WebUI 的仓库,集成了多种常用开发工具和服务。

## 主要特性

- 基于 Debian Bookworm 的基础镜像
- 集成多种开发工具和服务:
  - Cloudreve 网盘系统
  - AList 文件列表程序
  - MinIO 对象存储
  - Aria2 下载工具
  - 支持 CUDA 开发环境
  - Python开发环境
- 预配置的目录结构,便于文件管理
- 支持 VS Code Dev Container 开发
- 支持 GitHub Codespaces

## 技术栈

- Docker 容器技术
- VS Code Dev Container
- Supervisor 进程管理
- CUDA/CUDNN 深度学习环境
- Python/Conda 环境
- Java 开发环境
- Rust 工具链

## 快速开始

### 使用 VS Code Dev Container

1. 安装 VS Code 和 Docker
2. 安装 VS Code Remote Development 插件包
3. 克隆本仓库
4. 在 VS Code 中打开仓库目录
5. 点击左下角绿色按钮,选择 "Reopen in Container"

### 使用 GitHub Codespaces

1. 在 GitHub 仓库页面点击 "Code" 按钮
2. 选择 "Open with Codespaces"
3. 点击 "New codespace"

## 目录结构

容器内预配置了以下目录结构:

```
/DATA/
├── AppData
├── Documents
├── Downloads
├── Gallery
├── Compressed
├── Desktop
├── Games
├── General
├── ISOS
├── Media
│   ├── Movies
│   ├── Music
│   └── TV_Shows
├── Others
├── Programs
├── Public
├── Templates
├── Tools
├── Torrents
└── Videos
```

## 服务访问

容器启动后可访问以下服务:

- Cloudreve: http://localhost:5212
- AList: http://localhost:5244
- MinIO: http://localhost:9000
- Open WebUI: http://localhost:8000

## 环境变量配置

- MINIO_ROOT_USER: MinIO 管理员用户名(默认:admin)
- MINIO_ROOT_PASSWORD: MinIO 管理员密码(默认:password)

## 开发工具支持

- Python 3.11 + Jupyter Lab
- CUDA 12.4 + CUDNN 9.7
- PowerShell
- 常用开发工具(git、curl、wget等)

## 注意事项

1. 首次启动容器时会自动安装配置各项服务,可能需要一定时间
2. 建议在使用前修改默认密码
3. 如需持久化数据,请将重要数据目录映射到宿主机
4. CUDA 相关功能需要宿主机支持 NVIDIA GPU

## 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 贡献

欢迎提交 Issue 和 Pull Request 来帮助改进这个项目。

## 相关项目

- [VS Code Remote Development](https://aka.ms/vscode-remote/containers)
- [GitHub Codespaces](https://github.com/features/codespaces)
- [Cloudreve](https://github.com/cloudreve/Cloudreve)
- [AList](https://github.com/alist-org/alist)
- [MinIO](https://min.io/)
```