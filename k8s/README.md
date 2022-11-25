
'developer-role', should have all(*) permissions for services in development namespace

'developer-role', should have all permissions(*) for persistentvolumeclaims in development namespace

'developer-role', should have all(*) permissions for pods in development namespace

---

create rolebinding = developer-rolebinding, role= 'developer-role', namespace = development

rolebinding = developer-rolebinding associated with user = 'martin'


---


set context 'developer' with user = 'martin' and cluster = 'kubernetes' as the current context.


---
