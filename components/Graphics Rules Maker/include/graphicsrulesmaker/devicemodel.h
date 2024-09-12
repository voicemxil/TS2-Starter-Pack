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

#ifndef DEVICEMODEL_H
#define DEVICEMODEL_H

#include <QtCore/QAbstractTableModel>
#include <QtCore/QList>

#include "graphicsrulesmaker_config.h"

class IDXGIFactory1;

struct GraphicsMode
{
    quint16 width;
    quint16 height;
    quint16 refreshRate;
    bool operator ==(const GraphicsMode &other) const;
    bool operator <(const GraphicsMode &other) const;
};

struct GraphicsDevice
{
    QString name;
    QString driver;
    QString display;
    quint64 memory;
    quint64 sharedMemory;
    quint16 vendorId;
    quint16 deviceId;
    QList<GraphicsMode> modes;
};

uint qHash(GraphicsMode key, uint seed = 0);

class GRAPHICSRULESMAKER_EXPORT DeviceModel : public QAbstractTableModel
{
    Q_OBJECT

private:
    QList<GraphicsDevice> m_devices;
#ifdef Q_OS_WIN32
    bool loadD3d9();
#ifdef DXGI
    bool loadDxDgi();
#endif
#endif

public:
    explicit DeviceModel(QObject *parent = 0);

    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const {
        if (parent.isValid()) {
            return 0;
        }
        return m_devices.count();
    }
    virtual int columnCount(const QModelIndex &parent = QModelIndex()) const {
        Q_UNUSED(parent);
        return 7;
    }

    virtual QVariant data(const QModelIndex &index, int role) const;
    virtual QVariant headerData(int section, Qt::Orientation orientation, int role) const;

    GraphicsDevice device(int row) const { return m_devices.at(row); }
    QList<GraphicsMode> allModes();

signals:
    void loaded();
    void loadFailed();

public slots:
    void load();
};

#endif // DEVICEMODEL_H
