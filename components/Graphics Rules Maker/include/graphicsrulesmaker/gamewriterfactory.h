/*
 * Graphics Rules Maker
 * Copyright (C) 2014 Wouter Haffmans <wouter@simply-life.net>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef GAMEWRITERFACTORY_H
#define GAMEWRITERFACTORY_H

#include <QtCore/QObject>
#include <QtCore/QStringList>
#include <QtCore/QMap>
#include <QtCore/QDir>

#include "graphicsrulesmaker_config.h"

class GameWriterInterface;

class GRAPHICSRULESMAKER_EXPORT GameWriterFactory : public QObject
{
    Q_OBJECT

public:
    GameWriterFactory(QObject* parent = 0);

    QList<GameWriterInterface*> plugins() const;
    QStringList pluginNames() const;

    GameWriterInterface* plugin(const QString &id) const;

    /**
     * The directory to search in for translations of the provided plugin.
     */
    QString translationDirectory(const QString &id) const;
    /**
     * The filename (as base) to search translations files with.
     */
    QString translationFilename(const QString &id) const;

    ~GameWriterFactory();

public slots:
    void loadPlugins();

private:
    QList<QDir> m_searchDirectories;
    QList<GameWriterInterface*> m_plugins;

    /**
     * Full filename paths of plugins (id->filename)
     */
    QMap<QString, QString> m_pluginPaths;

};

#endif // GAMEWRITERFACTORY_H
