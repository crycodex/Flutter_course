# TikTok Simulator - Flutter App

Un simulador completo de TikTok desarrollado con Flutter que replica las funcionalidades principales de la aplicación original.

## 🚀 Características Principales

### 📱 Interfaz de Usuario
- **Navegación vertical** con PageView para deslizar entre videos
- **Controles de video** con play/pause, progreso y controles táctiles
- **Interfaz moderna** con gradientes y animaciones fluidas
- **Diseño responsive** que se adapta a diferentes tamaños de pantalla

### 🎥 Reproductor de Video
- **Reproducción automática** de videos en loop
- **Controles táctiles** (tap para controles, doble tap para play/pause)
- **Indicador de progreso** en tiempo real
- **Controles de volumen** y mute
- **Información del video** con caption, hashtags y música

### ❤️ Interacciones Sociales
- **Sistema de likes** con animaciones y contadores
- **Comentarios** con diálogo modal y lista de comentarios
- **Compartir videos** con múltiples opciones
- **Seguir usuarios** con botones dinámicos
- **Contadores de vistas** automáticos

### 📊 Estadísticas y Métricas
- **Panel de estadísticas** detallado con likes, comentarios, vistas y shares
- **Información temporal** (cuándo se publicó el video)
- **Duración del video** y metadatos
- **Música y hashtags** asociados

### 🔔 Notificaciones y UI
- **Badges animados** para notificaciones
- **Indicadores de progreso** para navegación
- **Botones de acción** con animaciones
- **Menú de opciones** expandible

### ⚙️ Funcionalidades Avanzadas
- **Pull-to-refresh** para recargar contenido
- **Carga infinita** de videos
- **Estado persistente** con Provider
- **Animaciones fluidas** con AnimateDo
- **Diálogos modales** para comentarios y compartir

## 🛠️ Tecnologías Utilizadas

- **Flutter** - Framework de desarrollo
- **Provider** - Gestión de estado
- **Video Player** - Reproducción de videos
- **AnimateDo** - Animaciones avanzadas
- **Material Design** - Componentes de UI

## 📁 Estructura del Proyecto

```
lib/
├── config/
│   ├── app_theme.dart
│   └── helpers/
│       └── num_format.dart
├── domain/
│   └── entities/
│       └── video_post.dart
├── infraestructure/
│   └── models/
│       └── local_video_model.dart
├── presentation/
│   ├── providers/
│   │   └── discover_provider.dart
│   ├── screens/
│   │   └── discover/
│   │       └── discover_screen.dart
│   └── widgets/
│       ├── shared/
│       │   ├── video_buttons.dart
│       │   ├── video_scrollable_view.dart
│       │   ├── video_stats.dart
│       │   ├── notification_badge.dart
│       │   └── options_menu.dart
│       └── video/
│           ├── background.dart
│           └── full_screen_player.dart
└── shared/
    └── data/
        └── local_video_post.dart
```

## 🎯 Funcionalidades Detalladas

### 1. Navegación de Videos
- Desliza verticalmente para cambiar de video
- Indicador de progreso en la parte superior
- Carga automática de más videos al llegar al final

### 2. Controles de Video
- **Tap simple**: Muestra/oculta controles temporales
- **Doble tap**: Pausa/reproduce el video
- **Barra de progreso**: Muestra el avance del video
- **Controles de volumen**: Mute/unmute

### 3. Interacciones Sociales
- **Like**: Animación de corazón con contador
- **Comentarios**: Diálogo modal con lista de comentarios
- **Compartir**: Opciones de copiar, compartir, descargar y reportar
- **Seguir**: Botón dinámico para seguir/dejar de seguir usuarios

### 4. Estadísticas
- Panel expandible con métricas detalladas
- Información temporal relativa
- Metadatos del video (duración, música, hashtags)

### 5. Menú de Opciones
- Configuración de la aplicación
- Información sobre el simulador
- Ayuda y tutoriales
- Sistema de feedback

## 🚀 Cómo Ejecutar

1. **Clona el repositorio**
   ```bash
   git clone <repository-url>
   cd sim_tiktok
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 📱 Uso de la Aplicación

### Navegación Básica
- **Desliza hacia arriba/abajo**: Cambia entre videos
- **Tap en el video**: Muestra controles temporales
- **Doble tap**: Pausa/reproduce el video

### Interacciones
- **Botón de corazón**: Dar/quitar like
- **Botón de comentarios**: Abrir diálogo de comentarios
- **Botón de compartir**: Mostrar opciones de compartir
- **Botón de estadísticas**: Ver métricas del video

### Menú y Opciones
- **Botón de tres puntos**: Abrir menú de opciones
- **Botón de refresh**: Recargar contenido
- **Botón de notificaciones**: Ver notificaciones

## 🎨 Personalización

### Temas y Colores
- Modifica `lib/config/app_theme.dart` para cambiar colores
- Personaliza gradientes en `lib/presentation/widgets/video/background.dart`

### Datos de Video
- Edita `lib/shared/data/local_video_post.dart` para agregar más videos
- Modifica la estructura de datos en `lib/domain/entities/video_post.dart`

### Animaciones
- Ajusta duraciones en los controladores de animación
- Modifica curvas de animación para diferentes efectos

## 🔧 Configuración Avanzada

### Gestión de Estado
El proyecto utiliza Provider para la gestión de estado:
- `DiscoverProvider`: Maneja la lista de videos y interacciones
- Estado persistente de likes y seguimientos
- Carga infinita de contenido

### Reproducción de Video
- Soporte para múltiples formatos de video
- Control de volumen y mute
- Loop automático de videos
- Gestión de memoria optimizada

## 📈 Próximas Mejoras

- [ ] Integración con APIs reales
- [ ] Sistema de autenticación
- [ ] Subida de videos
- [ ] Filtros y búsqueda
- [ ] Modo offline
- [ ] Notificaciones push
- [ ] Compartir en redes sociales
- [ ] Efectos y filtros de video

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para detalles.

## 👨‍💻 Autor

**Cristhian Recalde**
- Desarrollador Flutter
- Especialista en desarrollo móvil
- Apasionado por crear experiencias de usuario excepcionales

---

**Nota**: Este es un proyecto educativo para aprender Flutter y desarrollo móvil. No está afiliado oficialmente con TikTok.
