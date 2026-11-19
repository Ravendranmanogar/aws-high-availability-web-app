# ☁️ Highly Available Web Application on AWS

A hands-on AWS Cloud project demonstrating how to deploy a web application with load balancing, automatic instance management, monitoring, and email notifications.

The project explores AWS infrastructure concepts such as **High Availability, Load Balancing, Auto Scaling, Monitoring, and Fault Recovery**.

---

## 📌 Project Overview

This project implements a highly available web application architecture using AWS services.

The application is hosted on Amazon EC2 instances running Apache HTTP Server. Incoming traffic is distributed through a Classic Load Balancer, while an Auto Scaling Group manages EC2 instance capacity. Amazon CloudWatch monitors infrastructure metrics, and Amazon SNS provides email notifications.

### 🎯 Objectives

- Deploy and host a web application on AWS EC2.
- Configure a Classic Load Balancer for traffic distribution.
- Create reusable Amazon Machine Images (AMIs).
- Configure Launch Templates for EC2 deployment.
- Implement an Auto Scaling Group.
- Monitor CPU utilization using Amazon CloudWatch.
- Configure email notifications using Amazon SNS.
- Test instance recovery and application availability.

---

## 🏗️ Architecture

![Highly Available Web Application Architecture](architecture/architecture.png)

### Architecture Components

| Component | Purpose |
|---|---|
| Internet | Provides access to the web application |
| Classic Load Balancer | Distributes incoming HTTP traffic |
| Amazon EC2 | Hosts the web application |
| Auto Scaling Group | Manages EC2 instance capacity |
| Amazon AMI | Reusable server image |
| Launch Template | Defines EC2 launch configuration |
| Amazon CloudWatch | Monitors infrastructure metrics |
| Amazon SNS | Sends email notifications |

---

## 🛠️ AWS Services & Technologies

- **Amazon EC2** – Virtual servers for hosting the web application.
- **Amazon Linux 2** – Operating system for EC2 instances.
- **Apache HTTP Server** – Web server used to host the application.
- **Amazon Machine Image (AMI)** – Reusable image of the configured server.
- **Launch Template** – Template for launching EC2 instances.
- **Classic Load Balancer (CLB)** – Distributes incoming traffic across EC2 instances.
- **Auto Scaling Group (ASG)** – Maintains and manages EC2 instance capacity.
- **Amazon CloudWatch** – Monitors CPU utilization and alarm status.
- **Amazon SNS** – Delivers email notifications.
- **Linux** – Server administration and configuration.

---

## ⚙️ Implementation Steps

### 1. Launch an EC2 Instance

- Launched an EC2 instance using Amazon Linux 2.
- Configured the required key pair.
- Configured Security Group rules for SSH and HTTP access.

### 2. Connect to EC2

Connected to the instance using SSH/EC2 connection tools to configure the server.

### 3. Install Apache HTTP Server

Updated system packages and installed Apache.

```bash
sudo yum update -y
sudo yum install httpd -y
```

Enabled and started Apache:

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

Verified the Apache service:

```bash
sudo systemctl status httpd
```

### 4. Host the Web Application

- Downloaded a website template.
- Configured the web content on the Apache server.
- Verified the website through the EC2 public IP address.

### 5. Create an Amazon Machine Image (AMI)

Created an AMI from the configured EC2 instance to reuse the web server configuration when launching additional instances.

### 6. Create a Launch Template

Configured an EC2 Launch Template using:

- AMI
- Instance type
- Key pair
- Security Group

The Launch Template provides a reusable configuration for launching EC2 instances.

### 7. Configure Classic Load Balancer

Created an AWS Classic Load Balancer.

Configuration:

- Listener: HTTP
- Port: 80
- Health Check Protocol: HTTP
- Health Check Port: 80
- Health Check Path: `/`
- Healthy Threshold: 2
- Unhealthy Threshold: 2
- Timeout: 5 seconds
- Interval: 30 seconds

The Load Balancer distributes incoming requests to registered EC2 instances.

### 8. Configure Auto Scaling Group

Created an Auto Scaling Group using the Launch Template.

| Setting | Value |
|---|---|
| Desired Capacity | 2 |
| Minimum Capacity | 2 |
| Maximum Capacity | 5 |
| Health Check | EC2 + ELB |

Configured the Auto Scaling Group to work with the Load Balancer.

### 9. Verify Auto Scaling Instances

Verified that:

- Two EC2 instances were running.
- Instances registered with the Load Balancer.
- Instance health status showed `InService`.

### 10. Create an SNS Topic

Created an Amazon SNS topic to handle email notifications.

### 11. Configure Email Subscription

- Created an email subscription to the SNS topic.
- Confirmed the subscription through the email inbox.

### 12. Configure CloudWatch Alarm

Configured a CloudWatch alarm to monitor EC2 CPU utilization.

Monitoring configuration included:

- Metric: CPUUtilization
- Namespace: EC2
- Evaluation periods: 2 consecutive periods
- Alarm notification: SNS

### 13. Observe Monitoring and Scaling Activity

Observed CloudWatch metrics and alarm status changes.

Reviewed Auto Scaling activity to monitor EC2 instance launch activity.

### 14. Verify SNS Notifications

Verified email notification delivery when the CloudWatch alarm changed state.

### 15. Test Load Balancer

Accessed the web application using the Classic Load Balancer DNS address.

Refreshed the application multiple times to verify that the application remained accessible through the Load Balancer.

### 16. Test High Availability

Performed an instance failure simulation by terminating an EC2 instance.

Observed:

- Auto Scaling activity
- Replacement EC2 instance launch
- Load Balancer instance registration
- Continued web application availability

---

## 🔄 Application Workflow

```text
                 Internet Users
                       |
                       v
             Classic Load Balancer
                       |
          +------------+------------+
          |                         |
          v                         v
      EC2 Instance 1           EC2 Instance 2
      Apache Server             Apache Server
          |                         |
          +------------+------------+
                       |
               Auto Scaling Group
                       |
             Instance Management
                       |
             CloudWatch Monitoring
                       |
                       v
                 Amazon SNS
                       |
                       v
               Email Notification
```

---

## 📊 Key Learning Outcomes

Through this project, I gained hands-on experience with:

- AWS EC2 instance provisioning and management.
- Linux server administration.
- Apache web server installation and configuration.
- AMI creation and reuse.
- EC2 Launch Templates.
- Load Balancing concepts.
- Auto Scaling fundamentals.
- CloudWatch monitoring and alarms.
- SNS email notifications.
- High Availability concepts.
- Infrastructure troubleshooting.
- Instance failure and recovery behavior.

---

## 📸 Project Screenshots

Screenshots documenting the implementation can be found in the `screenshots/` directory.

Suggested screenshots:

- EC2 Instances
- Apache Web Application
- Classic Load Balancer
- Load Balancer Health Status
- Auto Scaling Group
- CloudWatch Alarm
- SNS Subscription
- Auto Scaling Activity

---

## 📁 Repository Structure

```text
aws-high-availability-web-app/
│
├── README.md
│
├── architecture/
│   └── architecture.png
│
├── screenshots/
│   ├── ec2-instances.png
│   ├── web-application.png
│   ├── load-balancer.png
│   ├── auto-scaling-group.png
│   ├── cloudwatch-alarm.png
│   └── sns-notification.png
│
└── scripts/
    └── install-apache.sh
```

---

## 🚀 Future Improvements

- Implement HTTPS using SSL/TLS certificates.
- Configure Application Load Balancer.
- Implement more advanced Auto Scaling policies.
- Automate infrastructure deployment using Terraform.
- Build CI/CD pipelines using Jenkins.
- Containerize the application using Docker.
- Implement centralized logging and monitoring.
- Improve infrastructure security and access management.

---

## 👨‍💻 Author

**Ravendran Manogar**

Aspiring Cloud & DevOps Engineer

Interested in AWS, Linux, Cloud Infrastructure, Automation, Networking, and DevOps.

📫 Connect with me on [LinkedIn](https://www.linkedin.com/in/ravendran-manogar/)

---

⭐ If you find this project interesting, feel free to explore the repository.