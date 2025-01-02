import 'package:exam_demo/models/question.dart';

class QuestionDao {

  static final List<Question> _fakeQuestions = [

    Question(
      id: '1',
      subject: 'SAA',
      questionText:
          '1. 您擁有一個需要高可用性的應用程式。請問下列哪一種設計最能確保服務不中斷？',
      options: [
        '將 EC2 分佈在多個可用區 (Multi-AZ) 並使用負載平衡',
        '只在單一可用區啟動 EC2 就好',
        '在本地機房再建一套系統備援',
        '不用考慮高可用，AWS 服務本身已提供 100% SLA'
      ],
      correctIndex: 0,
    ),
    Question(
      id: '2',
      subject: 'SAA',
      questionText:
          '2. 若想對 EC2 進行自動水平方向擴展 (Scale Out)，該使用哪項服務組合？',
      options: [
        'Auto Scaling 搭配 ELB (Elastic Load Balancer)',
        '只能靠手動在 EC2 主機上安裝更多 CPU',
        '在 S3 中設定版本控管',
        'Route 53 設定加速器'
      ],
      correctIndex: 0,
    ),
    Question(
      id: '3',
      subject: 'SAA',
      questionText:
          '3. 您需要儲存海量的靜態檔案，並且希望成本低、可擴充性高。哪一項 AWS 服務最合適？',
      options: [
        'Amazon RDS',
        'Amazon S3',
        'Amazon DynamoDB',
        'Amazon SNS'
      ],
      correctIndex: 1,
    ),
    Question(
      id: '4',
      subject: 'SAA',
      questionText:
          '4. 您打算將一個傳統應用程式容器化後部署，並且希望更容易管理叢集。該使用哪項服務？',
      options: [
        'Amazon EC2 直接安裝 Docker',
        'Amazon EKS (Elastic Kubernetes Service)',
        'Amazon EMR (Elastic MapReduce)',
        'Amazon WorkSpaces'
      ],
      correctIndex: 1,
    ),
    Question(
      id: '5',
      subject: 'SAA',
      questionText:
          '5. 下列哪一項可以實現資料庫的多可用區備援 (Multi-AZ)？',
      options: [
        '使用 Amazon RDS 並勾選 Multi-AZ 部署',
        '在同一台 EC2 安裝兩個資料庫實例',
        '將資料庫備份上傳到 S3',
        'Lambda Cron Job 定期複製資料'
      ],
      correctIndex: 0,
    ),

    Question(
      id: '6',
      subject: 'GCP',
      questionText:
          '1. 您想要使用無伺服器架構來執行後端邏輯，下列哪項 GCP 服務最適合？',
      options: [
        'Compute Engine (CE)',
        'Cloud Functions',
        'Cloud Storage',
        'Google Kubernetes Engine (GKE)'
      ],
      correctIndex: 1,
    ),
    Question(
      id: '7',
      subject: 'GCP',
      questionText:
          '2. 想要儲存海量物件檔案（照片、影片等），並能透過 URL 存取，哪一項服務最合適？',
      options: [
        'Cloud Spanner',
        'Cloud Storage',
        'BigQuery',
        'Dataflow'
      ],
      correctIndex: 1,
    ),
    Question(
      id: '8',
      subject: 'GCP',
      questionText:
          '3. 關於 GCP 中的 App Engine，下列哪一項描述最正確？',
      options: [
        '需要自行管理 VM 的規模與配置',
        '只能部署 Python 應用程式',
        '是一種完全受管的無伺服器平台 (Platform as a Service)',
        '主要用於建構資料流處理 (Data Pipeline)'
      ],
      correctIndex: 2,
    ),
    Question(
      id: '9',
      subject: 'GCP',
      questionText:
          '4. 在 GCP 中，若需要大規模資料分析 (Data Warehouse) 能力，應該選擇哪項服務？',
      options: [
        'Cloud SQL',
        'BigQuery',
        'Cloud IAM',
        'Cloud DNS'
      ],
      correctIndex: 1,
    ),
    Question(
      id: '10',
      subject: 'GCP',
      questionText:
          '5. 您想要在 Kubernetes 叢集上部署容器化應用程式，GCP 提供何種托管服務？',
      options: [
        'Google Kubernetes Engine (GKE)',
        'Cloud Run',
        'Compute Engine',
        'App Engine Standard'
      ],
      correctIndex: 0,
    ),
  ];

  // 依照考科 (subject) 取得對應的假題目
  static List<Question> getQuestionsBySubject(String subject) {
    return _fakeQuestions.where((q) => q.subject == subject).toList();
  }
}
