# ecr-change-tag
You can change tag of images on ECR easily.   

You have a image on ECR such as "image1:tag1"   
You want to change the tag of the image without pull the image to local  

You can now use the Docker image to run your script. Make sure to pass your AWS credentials and config as environment variables or as mounted files.   
```bash
docker run -e AWS_ACCESS_KEY_ID=your-access-key-id -e AWS_SECRET_ACCESS_KEY=your-secret-access-key -e AWS_DEFAULT_REGION=us-west-2 mrnim94/ecr-change-tag <image_on_ecr> <old_tag> <new_tag> <profile>
```

```bash
docker run -v ~/.aws:/root/.aws mrnim94/ecr-change-tag <image_on_ecr> <old_tag> <new_tag> <profile> <region>
```
